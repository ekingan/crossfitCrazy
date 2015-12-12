class AddRatingsToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :programming, :integer
    add_column :reviews, :facility, :integer
    add_column :reviews, :community, :integer
    add_column :reviews, :value, :integer
    add_column :reviews, :schedule, :integer
    add_column :reviews, :trainers, :integer
    add_column :reviews, :weightlifting_focus, :boolean
    add_column :reviews, :metcon_focus, :boolean
  end
end
