module Api
  module V1
    class SessionsController < ApplicationController
      include Errors
      respond_to :json
      skip_before_filter :authenticate_user!

      def create
        if warden.authenticate?(:password, scope: :user)
          # return user as json
          @user = current_user
          # Create authentication token for user
          current_user.generate_authentication_token
        else
          unauthorized_error('Unauthorized Access. Wrong username or password.')
        end
      end
    end
  end
end
