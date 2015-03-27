class CreateKitchensTable < ActiveRecord::Migration
  def change
    create_table :kitchens do |t|
      t.string :name
      t.integer :owner_id
      t.string :description
      t.integer :category_id
    end
  end
end
