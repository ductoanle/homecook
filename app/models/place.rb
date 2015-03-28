class Place < ActiveRecord::Base
  validates_presence_of :address, :timeslot, :owner_id, :area

  belongs_to :owner, class_name: 'User'
end
