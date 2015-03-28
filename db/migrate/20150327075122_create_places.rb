class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :address
      t.float :longitude
      t.float :latitude
      t.datetime :timeslot
      t.integer :owner_id
    end
  end
end
