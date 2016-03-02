class CreateLibraryLocations < ActiveRecord::Migration
  def change
    create_table :library_locations do |t|
      t.string :city_name
      t.string :latitude
      t.string :longitude
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
