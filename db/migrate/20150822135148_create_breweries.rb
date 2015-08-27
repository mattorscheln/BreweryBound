class CreateBreweries < ActiveRecord::Migration
  def change
    create_table :breweries do |t|
      t.integer :brewery_id
      t.text :notes
      t.string :image_url
      t.text :address
      t.text :name

      t.timestamps

    end
  end
end
