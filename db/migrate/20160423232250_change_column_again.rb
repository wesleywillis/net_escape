class ChangeColumnAgain < ActiveRecord::Migration
  def change
    change_column :gears, :lost, :string
  end
end
