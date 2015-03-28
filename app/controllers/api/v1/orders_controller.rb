module Api
  module V1
    class OrdersController < ApplicationController
      include Errors
      respond_to :json
      before_filter :load_dish
      before_filter :load_place

      TYPE_BUYER = 'buyer'
      TYPE_OWNER = 'owner'

      def index
        if current_user.present?
          type = params[:type] || TYPE_BUYER
          @orders = Order.find_by_buyer_id(current_user.id)
        else
          unprocessable_entity_error('User is not logged in or missing dish')
        end
      end

      def create
        unless current_user.present? && @dish.present?
          unprocessable_entity_error('User is not logged in or missing dish')
          return
        end

        place = @place.present? ? @place : @dish.places.first
        @order = Order.new(dish: @dish, place: @place, buyer: current_user, quantity: order_params[:quantity], total: calculate_total(@dish.price, order_params[:quantity].to_i), status: 'confirmed')

        unless @order.check_quantity_available(@dish)
          unprocessable_entity_error('The dish was sold out')
          return
        end

        # Transaction
        begin
          payment = Simplify::Payment.create({
            "token" => params[:simplify_token],
            "amount" => @order.total * 100,
            "currency" => "SGD",
            "reference" => @order.id,
            "description" => "#{@dish.description}"
          })

          # when the card is not approved by the API
          unless payment['paymentStatus'] == 'APPROVED'
            unprocessable_entity_error("Error creating order #{@order.errors}")
            return
          end

          # when failed to save the order
          unless @order.save
            unprocessable_entity_error("Error creating order #{payment['paymentStatus']}")
            return
          end

          @dish.quantity -= @order.quantity
          @dish.save
          render :show

        rescue Simplify::ApiException => e
          puts "Message:      #{e.message}"
          puts "Reference:    #{e.reference}"
          puts "Error code:   #{e.errorCode}"
          if e.is_a?(Simplify::BadRequestException) and
            e.fieldErrors.each do |fieldError|
              puts "#{fieldError.fieldName} '#{fieldError.message}' (#{fieldError.errorCode})"
            end
          end
          unprocessable_entity_error("Error creating order #{e}")
          return
        end
      end

      def confirm
        @order = Order.find(params[:id])
        begin
          MoneyTransferService.transfer(@order)
        rescue Exception => e
          unprocessable_entity_error("Error creating order #{e}")
          return
        end
        render :show
      end

      private
      def calculate_total(price, quantity)
        return price * quantity
      end

      def order_params
        params.permit(:dish_id, :place_id, :user_id, :quantity)
      end
      def load_dish
        @dish = Dish.find_by_id(params[:dish_id])
      end
      def load_place
        @place = Place.find_by_id(params[:place_id]) if params[:place_id].present?
      end
    end
  end
end
