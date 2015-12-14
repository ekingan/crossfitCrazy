class Gym < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	
	reverse_geocoded_by :lat, :long, 
	:address => :address, :latitude => :lat, :longitude => :long 
	# after_validation :reverse_geocode, :geocode

	def avg_rating(attribute)
		if reviews.none?
		  val = 0
		else 
		  val = reviews.average(attribute).round(2).to_i
		end
		return val
	end

	def w_vs_m
		weightlifting = reviews.where(weightlifting_focus: true).count
    metcon =  reviews.where(metcon_focus: true).count
    
    if weightlifting  == 0 && metcon == 0
      @focus = ""
    elsif weightlifting > metcon
      @focus = "This gym focuses on weightlifting"
    elsif metcon < weightlifting
      @focus = "This gym focuses on metcon training"
    else 
      @focus = "This gym offers a balance of weightlifting and metcon training"
    end  
    return @focus
  end



	def self.search(search)

  	if search
    	self.where('name ILIKE ?', "%#{search}%")
  	else
    	self.all
  	end
	end
end

