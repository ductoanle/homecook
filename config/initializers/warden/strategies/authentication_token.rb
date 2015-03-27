Warden::Strategies.add(:authentication_token) do
  def valid?
    !params["token"].blank?
  end

  def authenticate!
    return fail! if (user_id = $redis.get(params["token"])).blank?
    return fail! if (user = User.find_by_id(user_id)).blank?
    success! user
  end
end
