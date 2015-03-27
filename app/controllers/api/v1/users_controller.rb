module Api
  module V1
    class UsersController < ApplicationController
      include Errors
      respond_to :json
      skip_before_filter :authenticate_user!, only: [:sign_up]

      def sign_up
        @user = User.new(user_params)
        if @user.save
          render :profile
        else
          unprocessable_entity_error("Error creating user #{@user.errors}")
        end
      end

      def profile
        @user = current_user
      end

      private
      def user_params
        params.permit(:username, :email, :password, :password_confirmation)
      end
    end
  end
end
