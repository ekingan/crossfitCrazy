class Gym < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	
	def self.search(search)
  	if search
    	self.where('name LIKE ?', "%#{search}%")
  	else
    	self.all
  	end
	end
end

