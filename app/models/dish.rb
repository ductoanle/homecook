class Dish < ActiveRecord::Base
  validates_presence_of :name, :price, :owner_id, :quantity

  belongs_to :owner, class_name: 'User'
  has_many :images, as: :resource
  has_many :places, through: :owner

  def self.find_by_area(area)
    Dish.where(owner_id: User.includes(:places).where(places: {area: area}).map{|u| u.id})
  end
end
