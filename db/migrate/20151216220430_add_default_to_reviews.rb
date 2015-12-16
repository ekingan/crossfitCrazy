class AddDefaultToReviews < ActiveRecord::Migration
  def change
  	change_column :reviews, :programming, :integer, default: 0
  	change_column :reviews, :value, :integer, default: 0
  	change_column :reviews, :community, :integer, default: 0
  	change_column :reviews, :facility, :integer, default: 0
  	change_column :reviews, :schedule, :integer, default: 0
  	change_column :reviews, :trainers, :integer, default: 0
  end
end
