Rails.application.config.middleware.insert_after ActionDispatch::Flash, Warden::Manager do |manager|
  manager.default_strategies :authentication_token, :password
  manager.serialize_into_session do |user|
    user.id
  end
  manager.serialize_from_session do |id|
    user = User.find_by_id(id)
    if user.authentication_token.present? && $redis.get(user.authentication_token).to_i == id
      user
    else
      nil
    end
  end
  manager.failure_app = ErrorsController.action(:index)
  manager.default_scope = :user
end
