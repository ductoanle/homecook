class CreateAddress < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :line1
      t.string :line2
      t.string :city
      t.string :country_subdivision
      t.string :postal_code
      t.string :country
      t.integer :user_id
    end
  end
end
