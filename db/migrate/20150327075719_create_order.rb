class CreateOrder < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :dish_id
      t.integer :buyer_id
      t.integer :place_id
      t.integer :status, default: 0
      t.float :total
      t.integer :quantity
    end
  end
end
