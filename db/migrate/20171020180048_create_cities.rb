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
    add_foreign_key :counties, :states

    create_table :cities do |t|
      t.belongs_to :county, index: true
      t.belongs_to :state, index: true
      t.string :name
      t.string :zip_codes, array: true, default: []
      t.decimal :latitude
      t.decimal :longitude
      t.integer :population
      t.timestamps
    end
    add_foreign_key :cities, :counties
    add_foreign_key :cities, :states
  end
end
