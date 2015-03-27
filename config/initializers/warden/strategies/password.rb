Warden::Strategies.add(:password) do
  def valid?
    params['user'].present?
  end

  def authenticate!
    return fail! unless (user = User.find_by_username(params['username']))
    return fail! unless user.authenticate(params['password'])
    success! user
  end
end
