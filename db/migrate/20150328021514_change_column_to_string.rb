class ChangeColumnToString < ActiveRecord::Migration
  def change
    change_column :places, :timeslot, :string
  end
end
