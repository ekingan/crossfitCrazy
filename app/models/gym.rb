class Gym < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	

	reverse_geocoded_by :latitude, :longitude,
  :address => :location
	after_validation :reverse_geocode


	def self.search(search)
  	if search
    	self.where('name LIKE ?', "%#{search}%")
  	else
    	self.all
  	end
	end
end

