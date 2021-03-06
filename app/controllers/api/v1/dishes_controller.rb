module Api
  module V1
    class DishesController < ApplicationController
      include Errors
      respond_to :json

      before_filter :load_dish, only: [:show]

      def index
        if current_user.present?
          @dishes = current_user.dishes
        else
          if params[:area].present?
            @dishes = Dish.includes(:images).find_by_area(params[:area])
          else
            @dishes = Dish.includes(:images).all
          end
        end
      end

      def show
      end

      private
      def load_dish
        @dish = Dish.find_by_id(params[:id])
      end
    end
  end
end
