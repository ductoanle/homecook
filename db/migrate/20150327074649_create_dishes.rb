class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.integer :owner_id
      t.float :price
      t.integer :quantity
      t.datetime :last_order
      t.string :category
    end
  end
end
