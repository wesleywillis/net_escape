class ChangeColumnQuantity < ActiveRecord::Migration
  def change
    rename_column :gears, :quantity, :gear_quantity
  end
end
