class AddImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :url
      t.references :resource, polymorphic: true
    end
  end
end
