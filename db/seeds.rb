# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

State.destroy_all
County.destroy_all
City.destroy_all

filename = 'uscitiesv1.3.csv'
file = File.join(Rails.root, 'db', 'seed_data', filename)

# 0     1           2         3           4           5           6   7   8   9           10      11
# city  city_ascii  state_id  state_name  county_name county_fips zip lat lng population  source  id

n = 0
failures = []

CSV.foreach(file, headers: true) do |row|
  begin
    state = State.where(name: row[3]).first
    unless state
      state = State.new
      state.name = row[3]
      state.abbreviation = row[2]
      state.save!
      puts "State #{state.name} created"
    end

    county_attributes = {
      name: row[4],
      state: state
    }
    county = County.where(county_attributes).first 
    unless county
      county = County.new
      county.name = row[4]
      county.state = state
      county.save!
      puts "County #{county.name} created"
    end
    
    city = City.where(zip_code: row[6], name: row[1]).first
    unless city
      city = City.new
      city.name = row[1]
      city.zip_code = row[6]
      city.latitude = row[7]
      city.longitude =row[8]
      city.population = row[9]
      city.county = county
      city.state = state
      city.save!

      n += 1
      puts "Created ##{n} - #{city.name}"
    end
  rescue StandardError => error
    id = row[11]
    failures << id
    puts error.backtrace
    puts "Could not create city: #{id}"
  end
end

if failures.empty?
  "No failures"
else
  "Experienced #{failures.count} failures:"
  puts failures
end

