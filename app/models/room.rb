class Room < ActiveRecord::Base
	belongs_to :user
	
	validates_presence_of :price, :user_id
  # There are 640 station names. Check station_names method in the rooms helper.
	#validates :closest_station, inclusion: { in: (0..639) }
	validates :zone, inclusion: { in: (1..6) }
	validates :gender, inclusion: { in: %w(none female male) }
	validates_length_of :description, :maximum => 1000, :allow_blank => true

  def self.administrators
    # Array of administrator ids.
    []
  end
end