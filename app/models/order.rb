class Order < ActiveRecord::Base
  validates_presence_of :dish_id, :place_id, :buyer_id, :quantity, :total

  enum status: [:not_confirmed, :confirmed]

  belongs_to :dish
  belongs_to :place
  belongs_to :buyer, class_name: 'User'

  def check_quantity_available(dish)
    return false if self.quantity > dish.quantity
    true
  end
end
