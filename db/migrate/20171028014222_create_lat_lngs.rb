class CreateLatLngs < ActiveRecord::Migration[5.1]
  def change
    create_table :lat_longs do |t|
      t.belongs_to :city
      t.decimal :latitude
      t.decimal :longitude
      t.timestamps
    end

    add_foreign_key :lat_longs, :cities

    remove_column :cities, :latitude
    remove_column :cities, :longitude
  end
end
