class ChangeFoundColumn < ActiveRecord::Migration
  def change
    change_column :gears, :found, :string
  end
end
