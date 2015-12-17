class Review < ActiveRecord::Base
  belongs_to :gym, touch: true
  belongs_to :user



	before_save :total_rating

	before_destroy :total_rating

	def total_rating
		val = self.programming.to_i + self.value.to_i + self.community.to_i + self.value.to_i
		self.total_rating = val
	end
 
end
