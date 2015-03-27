class Kitchen < ActiveRecord::Base
  validates_uniqueness_of :name
  validates_presence_of :name

  belongs_to :owner, class_name: 'User'
end
