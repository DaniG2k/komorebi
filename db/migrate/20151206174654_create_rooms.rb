class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.float :price
      t.float :deposit
      t.boolean :internet
      t.boolean :furnished
      t.boolean :smoking
      t.string :gender
      t.string :closest_station
      t.integer :zone
      t.text :description

      t.timestamps null: false
    end
  end
end
