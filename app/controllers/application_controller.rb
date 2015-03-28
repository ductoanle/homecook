class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  protect_from_forgery with: :null_session

  #prepend_before_filter :authenticate_user!

  def current_user
    params[:username].present? ? User.find_by_username(params[:username]) : nil
  end

  #def current_user
  #  @current_user ||= begin
  #    user_id = warden.user(scope: :user)
  #    if user_id.present?
  #      User.find_by_id(user_id)
  #    else
  #      nil
  #    end
  #  end
  #end
  helper_method :current_user

  def user_signed_in?
    warden.authenticate?(:authentication_token, scope: :user)
  end
  helper_method :user_signed_in?

  def authenticate_user!
    unless user_signed_in?
      render json: Oj.dump({error: "Unauthorized Access. Wrong username or password."}), status: :unauthorized and return
    end
  end

  def force_authentication!(user)
    warden.set_user(user, scope: :user)
  end

  def warden
    request.env['warden']
  end
end
