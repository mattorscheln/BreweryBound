class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.text :notes
      t.boolean :visited
      t.integer :brewery_id
      t.integer :user_id

      t.timestamps

    end
  end
end
