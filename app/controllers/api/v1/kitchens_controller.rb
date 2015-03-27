module Api
  module V1
    class KitchensController < ApplicationController
      include Errors
      respond_to :json

      before_filter :load_kitchen, only: [:info]

      def create
        @kitchen = Kitchen.new(name: account_params[:name], owner_id: current_user.id)
        if @kitchen.save
          render :info
        else
          unprocessable_entity_error("Error creating account #{@kitchen.errors}")
        end
      end

      def info
      end

      private
      def account_params
        params.permit(:name)
      end

      def load_kitchen
        @kitchen = Kitchen.find_by_id(params[:id])
      end
    end
  end
end
