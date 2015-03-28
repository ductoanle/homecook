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
        if current_user.present? && @dish.present?
          place = @place.present? ? @place : @dish.places.first
          @order = Order.new(dish: @dish, place: @place, buyer: current_user, quantity: order_params[:quantity], total: calculate_total(@dish.price, order_params[:quantity].to_i))
          if @order.check_quantity_available(@dish) && @order.save
            # should be in a transaction here
            @dish.quantity -= @order.quantity
            @dish.save
            render :show
          else
            unprocessable_entity_error("Error creating order #{@order.errors}")
          end
        else
          unprocessable_entity_error('User is not logged in or missing dish')
        end
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
