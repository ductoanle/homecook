module Tokenable
  extend ActiveSupport::Concern

  def generate_authentication_token
    return if (token = self.authentication_token).present? && $redis.get(token) == self.id
    loop do
      token = SecureRandom.urlsafe_base64(nil, false)
      $redis.setex(token, 3600, self.id)
      if $redis.get(token).present?
        self.authentication_token = token
        self.save
        break
      end
    end
  end
end
