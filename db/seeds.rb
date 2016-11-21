# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

# puts "Finding or Creating Agency ..."

# csv_text = File.read(Rails.root.join('lib', 'seeds', 'agency.csv'))
# csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
# csv.each do |row|
#   t = Agency.new
#   t.name = row['agency_name']
#   t.url = row['agency_url']
#   t.timezone = row['agency_timezone']
#   t.lang = row['agency_lang']
#   t.phone = row['agency_phone']
#   t.fare_url = row['agency_fare_url']
#   t.save!
# end

puts 'Re-creating Agencies ...'

Agency.destroy_all
# rails g model agency agency_id name url timezone lang phone fare_url
csv_text = File.read(Rails.root.join('lib', 'seeds', 'agency.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
agency = Agency.new
agency.agency_id = csv['agency_id'][0]
agency.name = csv['agency_name'][0]
agency.url = csv['agency_url'][0]
agency.timezone = csv['agency_timezone'][0]
agency.lang = csv['agency_lang'][0]
agency.phone = csv['agency_phone'][0]
agency.fare_url = csv['agency_fare_url'][0]
agency.save!

puts 'Agencies created!'
puts 'Re-creating Routes ...'

Route.destroy_all
# rails g model route route_id agency:references short_name long_name route_type color text_color
csv_text = File.read(Rails.root.join('lib', 'seeds', 'routes.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
csv.each do |row|
  route = agency.routes.new
  route.route_id = row['route_id']
  route.short_name = row['route_short_name']
  route.long_name = row['route_long_name']
  route.route_type = row['route_type']
  route.color = row['route_color']
  route.text_color = row['route_text_color']
  route.save!
end

puts 'Routes created!'
puts 'Re-creating Trips ...'

Trip.destroy_all
# rails g model trip route:references service_id trip_id headsign short_name direction_id block_id shape_id wheelchair_accessible bikes_allowed route_variant
csv_text = File.read(Rails.root.join('lib', 'seeds', 'trips.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
csv.each do |row|
  route = Route.find_by_route_id(row['route_id'])
  trip = route.trips.new
  trip.service_id = row['service_id']
  trip.trip_id = row['trip_id']
  trip.headsign = row['trip_headsign']
  trip.short_name = row['trip_short_name']
  trip.direction_id = row['direction_id']
  trip.block_id = row['block_id']
  trip.shape_id = row['shape_id']
  trip.wheelchair_accessible = row['wheelchair_accessible']
  trip.bikes_allowed = row['bikes_allowed']
  trip.route_variant = row['route_variant']
  trip.save!
end

puts 'Trips created!'
# csv_text.truncate(0)

# csv_text = File.read(Rails.root.join('lib', 'seeds', 'trips.csv'))
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
# csv.each do |row|
#  t = Trip.new
#  t.route_id = row['route_id']
#  t.service_id = row['service_id']
#  t.trip_id = row['trip_id']
#  t.trip_headsign = row['trip_headsign']
#  t.trip_short_name = row['trip_short_name']
#  t.direction_id = row['direction_id']
#  t.block_id = row['block_id']
#  t.shape_id = row['shape_id']
#  t.wheelchair_accessible = row['wheelchair_accessible']
#  t.bikes_allowed = row['bikes_allowed']
#  t.route_variant = row['route_variant']
#  t.save
# end
