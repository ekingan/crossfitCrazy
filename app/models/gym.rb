class Gym < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	
	reverse_geocoded_by :lat, :long, 
	:address => :address, :latitude => :lat, :longitude => :long 
	after_validation :reverse_geocode, :geocode

	ratyrate_rateable :programming

	def self.search(search)
  	if search
    	self.where('name LIKE ?', "%#{search}%")
  	else
    	self.all
  	end
	end
end

