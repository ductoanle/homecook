class User < ActiveRecord::Base
  include Tokenable
  has_secure_password

  validates_uniqueness_of :email, :username
  validates_presence_of :email, :username, :password, :password_confirmation
  validate :email_regex

  def email_regex
    if email.present? and not email.match(/\A[^@]+@[^@]+\z/)
      errors.add :email, "This is not a valid email format"
    end
  end
end
