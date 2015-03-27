class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :authentication_token
      t.string :confirmation_token
      t.datetime :confirm_date
      t.timestamps
    end
  end
end
