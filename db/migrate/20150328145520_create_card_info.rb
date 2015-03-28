class CreateCardInfo < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :account_number
      t.integer :expiry_month
      t.integer :expiry_year
      t.integer :cvc
      t.integer :owner_id
    end
  end
end
