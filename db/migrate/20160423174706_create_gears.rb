class CreateGears < ActiveRecord::Migration
  def change
    create_table :gears do |t|
      t.string :gear_type
      t.integer :quantity
      t.string :color
      t.boolean :wildlife
      t.string :wildlife_type
      t.integer :wildlife_quantity
      t.float :latitude
      t.float :longitude
      t.boolean :lost
      t.boolean :found

      t.timestamps null: false
    end
  end
end
