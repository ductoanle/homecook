class Dish < ActiveRecord::Base
  validates_presence_of :name, :price, :owner_id, :quantity

  belongs_to :owner, class_name: 'User'
  has_many :images, as: :resource
end
