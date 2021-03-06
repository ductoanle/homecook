class User < ActiveRecord::Base
  include Tokenable
  has_secure_password

  validates_uniqueness_of :email, :username
  validates_presence_of :email, :username, :password, :password_confirmation
  validate :email_regex

  has_many :images, as: :resource
  has_many :dishes, foreign_key: :owner_id
  has_many :orders, through: :dishes
  has_many :places, foreign_key: :owner_id
  has_one :address
  has_one :card, foreign_key: :owner_id

  def purchase_order
    Order.where(buyer_id: self.id).to_a
  end

  def email_regex
    if email.present? and not email.match(/\A[^@]+@[^@]+\z/)
      errors.add :email, "This is not a valid email format"
    end
  end
end
