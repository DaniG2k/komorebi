class Room < ActiveRecord::Base
	belongs_to :user
	
	validates_presence_of :price
	validates :zone, inclusion: { in: (1..6) }
	validates :gender, inclusion: { in: %w(none female male) }
	validates_length_of :description, :maximum => 1000, :allow_blank => true
end