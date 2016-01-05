class Gym < ActiveRecord::Base
	has_many :reviews, dependent: :destroy

	
	reverse_geocoded_by :lat, :long, 
	:address => :address, :latitude => :lat, :longitude => :long 
	# after_validation :reverse_geocode, :geocode
	# after_update :all_total_ratings

	def avg_rating(attribute)
		if reviews.none?
		  val = 0
		else 
		  val = reviews.average(attribute)
		end
		return val
	end

	def all_total_ratings
		totals = self.reviews.map { |review| review.total_rating }
		grand_total = (totals.reduce(:+) / self.reviews.length)
		self.total_rating = grand_total
		p "in all total_ratings" * 100
		self.save
	end

	# def best_rating(attributes)
	# 	if reviews.none?
	# 	  val = 0
	# 	else 
	# 	  val = reviews.average(attributes)
	# 	end
	# 	return val
	# end

	def w_vs_m
		weightlifting = reviews.where(weightlifting_focus: true).count
    metcon =  reviews.where(metcon_focus: true).count
    
    if weightlifting  == 0 && metcon == 0
      @focus = ""
    elsif weightlifting > metcon
      @focus = "This gym focuses on weightlifting"
    elsif metcon > weightlifting
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

