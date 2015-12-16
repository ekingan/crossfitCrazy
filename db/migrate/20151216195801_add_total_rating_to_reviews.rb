class AddTotalRatingToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :total_rating, :integer
  end
end
