class AddTotalRatingToGyms < ActiveRecord::Migration
  def change
  	add_column :gyms, :total_rating, :integer
  end
end
