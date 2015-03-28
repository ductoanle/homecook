class CreateOrder < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :dish_id
      t.integer :buyer_id
      t.integer :place_id
      t.string :status
      t.float :total
      t.integer :quantity
    end
  end
end
