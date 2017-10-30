class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :states do |t|
      t.string :name
      t.string :abbreviation
      t.timestamps
    end

    create_table :counties do |t|
      t.belongs_to :state, index: true
      t.string :name
    end

    create_table :cities do |t|
      t.belongs_to :county, index: true
      t.belongs_to :state, index: true
      t.string :name
      t.string :zip_codes, array: true, default: []
      t.integer :population
      t.timestamps
    end

    create_table :seo_landing_pages do |t|
      t.belongs_to :state
      t.belongs_to :county
      t.belongs_to :city
      t.string :path
      t.timestamps
    end

    create_table :lat_longs do |t|
      t.belongs_to :city
      t.decimal :latitude
      t.decimal :longitude
      t.timestamps
    end

    add_foreign_key :counties, :states
    
    add_foreign_key :cities, :counties
    add_foreign_key :cities, :states
    
    add_foreign_key :seo_landing_pages, :cities
    add_foreign_key :seo_landing_pages, :counties
    add_foreign_key :seo_landing_pages, :states
    
    add_foreign_key :lat_longs, :cities

    add_index :seo_landing_pages, :path
  end
end
