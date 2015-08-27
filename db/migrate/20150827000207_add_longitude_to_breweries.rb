class AddLongitudeToBreweries < ActiveRecord::Migration
  def change
    add_column :breweries, :longitude, :float
  end
end
