class CreateGyms < ActiveRecord::Migration
  def change
    create_table :gyms do |t|
      t.float :lat
      t.float :long
      t.string :name
      t.string :website
      t.string :address
      t.string :phone

      t.timestamps null: false
    end
  end
end
