# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171022200925) do

  create_table "cities", force: :cascade do |t|
    t.integer "county_id"
    t.integer "state_id"
    t.string "name"
    t.string "zip_code"
    t.decimal "latitude"
    t.decimal "longitude"
    t.integer "population"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["county_id"], name: "index_cities_on_county_id"
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "counties", force: :cascade do |t|
    t.integer "state_id"
    t.string "name"
    t.index ["state_id"], name: "index_counties_on_state_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "param"
  end

end
