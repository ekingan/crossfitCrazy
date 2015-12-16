class AddIndexToGymTotalRating < ActiveRecord::Migration
  def change
  	add_index(:gyms, :total_rating)
  end
end
