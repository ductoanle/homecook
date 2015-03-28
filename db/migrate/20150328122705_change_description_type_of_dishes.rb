class ChangeDescriptionTypeOfDishes < ActiveRecord::Migration
  def change
    change_column :dishes, :description, :text
  end
end
