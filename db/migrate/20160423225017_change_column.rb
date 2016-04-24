class ChangeColumn < ActiveRecord::Migration
  def change
    change_column :gears, :lost, :integer
  end
end
