class Place < ActiveRecord::Base
  validates_presence_of :address, :timeslot, :kitchen_id

  belongs_to :kitchen
end
