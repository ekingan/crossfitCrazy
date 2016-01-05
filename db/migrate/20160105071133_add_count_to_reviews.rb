class AddCountToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :count, :integer
  end
end
