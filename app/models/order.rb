class Order < ActiveRecord::Base
  validates_presence_of :dish_id, :place_id, :buyer_id, :quantity, :status, :total

  belongs_to :dish
  belongs_to :place
  belongs_to :buyer, class_name: 'User'
end
