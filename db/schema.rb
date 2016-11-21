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

ActiveRecord::Schema.define(version: 20161118214209) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agencies", force: :cascade do |t|
    t.string   "agency_id"
    t.string   "name"
    t.string   "url"
    t.string   "timezone"
    t.string   "lang"
    t.string   "phone"
    t.string   "fare_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes", force: :cascade do |t|
    t.string   "route_id"
    t.integer  "agency_id"
    t.string   "short_name"
    t.string   "long_name"
    t.string   "route_type"
    t.string   "color"
    t.string   "text_color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agency_id"], name: "index_routes_on_agency_id", using: :btree
  end

  create_table "trips", force: :cascade do |t|
    t.integer  "route_id"
    t.string   "service_id"
    t.string   "trip_id"
    t.string   "headsign"
    t.string   "short_name"
    t.string   "direction_id"
    t.string   "block_id"
    t.string   "shape_id"
    t.string   "wheelchair_accessible"
    t.string   "bikes_allowed"
    t.string   "route_variant"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["route_id"], name: "index_trips_on_route_id", using: :btree
  end

  add_foreign_key "routes", "agencies"
  add_foreign_key "trips", "routes"
end
