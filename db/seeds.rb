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
LatLong.destroy_all
SeoLandingPage.destroy_all

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
      SeoLandingPage.create_from_state(state)
    end

    name = County.parse_name(row[4])
    county_query = state.counties.where(name: name)
    if county_query.empty?
      county = County.new
      county.state = state
      county.name = name
      county.save!
      puts "Created #{county.name}"
      SeoLandingPage.create_from_county(county)
    else
      county = county_query.first
    end
    
    zip_codes = (row[6] || '').split(' ')
    city = City.where(state: state, name: row[1]).first
    unless city
      city = City.new
      city.name = row[1]
      city.zip_codes = zip_codes
      city.population = row[9]
      city.county = county
      city.state = state

      lat_long = LatLong.new
      lat_long.latitude = row[7]
      lat_long.longitude = row[8]
      lat_long.save

      city.lat_long = lat_long

      city.save!

      n += 1
      puts "Created ##{n} - #{city.name}"

      SeoLandingPage.create_from_city(city)
    end
  rescue StandardError => error
    id = row[11]
    failures << id
    puts error.backtrace
    puts "Failed to create city: #{id}"
  end
end

if failures.empty?
  "No failures"
  "States: #{State.count}"
  "Counties: #{County.count}"
  "Cities: #{City.count}"
else
  "Experienced #{failures.count} failures:"
  puts failures
end
