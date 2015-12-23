class AddCouplesOkToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :couples_ok, :boolean
  end
end
