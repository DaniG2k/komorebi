class AddRoomImagesToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :room_images, :json
  end
end
