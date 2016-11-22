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

ActiveRecord::Schema.define(version: 20161121032458) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agencies", id: :string, force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "timezone"
    t.string "lang"
    t.string "phone"
    t.string "fare_url"
  end

  create_table "calendar_dates", force: :cascade do |t|
    t.string "service_id"
    t.string "date"
    t.string "exception_type"
  end

  create_table "routes", id: :string, force: :cascade do |t|
    t.string  "agency_id"
    t.string  "short_name"
    t.string  "long_name"
    t.integer "route_type"
    t.string  "color"
    t.string  "text_color"
  end

  create_table "stop_times", force: :cascade do |t|
    t.string  "trip_id"
    t.string  "arrival_time"
    t.string  "departure_time"
    t.string  "stop_id"
    t.integer "stop_sequence"
    t.integer "pickup_type"
    t.integer "drop_off_type"
  end

  create_table "stops", id: :string, force: :cascade do |t|
    t.string  "name"
    t.string  "lat"
    t.string  "lon"
    t.string  "zone_id"
    t.string  "url"
    t.integer "location_type"
    t.string  "parent_station"
    t.integer "wheelchair_boarding"
  end

  create_table "trips", id: :string, force: :cascade do |t|
    t.string  "route_id"
    t.string  "service_id"
    t.string  "headsign"
    t.string  "short_name"
    t.string  "direction_id"
    t.string  "block_id"
    t.string  "shape_id"
    t.integer "wheelchair_accessible"
    t.integer "bikes_allowed"
    t.string  "route_variant"
  end

  add_foreign_key "routes", "agencies", name: "routes_agency_id_fkey"
  add_foreign_key "stop_times", "stops", name: "stop_times_stop_id_fkey"
  add_foreign_key "stop_times", "trips", name: "stop_times_trip_id_fkey"
  add_foreign_key "trips", "routes", name: "trips_route_id_fkey"
end
