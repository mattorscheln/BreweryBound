class AddLatitudeToBreweries < ActiveRecord::Migration
  def change
    add_column :breweries, :latitude, :float
  end
end
