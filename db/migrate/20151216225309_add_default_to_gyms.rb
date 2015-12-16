class AddDefaultToGyms < ActiveRecord::Migration
  def change
  	change_column :gyms, :total_rating, :integer, default: 0
  end
end
