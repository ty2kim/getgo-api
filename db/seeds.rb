require 'csv'

##############################################################################
puts 'Re-creating Agencies ...'
Agency.destroy_all
csv_path = Rails.root.join('lib', 'seeds', 'agency.csv')
sql = "COPY agencies(id, name, url, timezone, lang, phone, fare_url) FROM " + "'" + csv_path.to_s + "'" + " DELIMITER ',' CSV HEADER;"
ActiveRecord::Base.connection.execute(sql)
puts 'Agencies created!'
##############################################################################
puts 'Re-creating Routes ...'
Route.destroy_all
csv_path = Rails.root.join('lib', 'seeds', 'routes.csv')
sql = "COPY routes(id, agency_id, short_name, long_name, route_type, color, text_color) FROM " + "'" + csv_path.to_s + "'" + " DELIMITER ',' CSV HEADER;"
ActiveRecord::Base.connection.execute(sql)
puts 'Routes created!'
##############################################################################
puts 'Re-creating Trips ...'
Trip.destroy_all
csv_path = Rails.root.join('lib', 'seeds', 'trips.csv')
sql = "COPY trips(route_id, service_id, id, headsign, short_name, direction_id, block_id, shape_id, wheelchair_accessible, bikes_allowed, route_variant) FROM " + "'" + csv_path.to_s + "'" + " DELIMITER ',' CSV HEADER;"
ActiveRecord::Base.connection.execute(sql)
puts 'Trips created!'
###############################################################################
puts 'Re-creating CalendarDates ...'
CalendarDate.destroy_all
csv_path = Rails.root.join('lib', 'seeds', 'calendar_dates.csv')
sql = "COPY calendar_dates(service_id, date, exception_type) FROM " + "'" + csv_path.to_s + "'" + " DELIMITER ',' CSV HEADER;"
ActiveRecord::Base.connection.execute(sql)
puts 'CalendarDates created!'
###############################################################################
puts 'Re-creating Stops ...'
Stop.destroy_all
csv_path = Rails.root.join('lib', 'seeds', 'stops.csv')
sql = "COPY stops(id, name, lat, lon, zone_id, url, location_type, parent_station, wheelchair_boarding) FROM " + "'" + csv_path.to_s + "'" + " DELIMITER ',' CSV HEADER;"
ActiveRecord::Base.connection.execute(sql)
puts 'Stops created!'
###############################################################################
puts 'Re-creating StopTimes ...'
StopTime.destroy_all
csv_path = Rails.root.join('lib', 'seeds', 'stop_times.csv')
sql = "COPY stop_times(trip_id, arrival_time, departure_time, stop_id, stop_sequence, pickup_type, drop_off_type) FROM " + "'" + csv_path.to_s + "'" + " DELIMITER ',' CSV HEADER;"
ActiveRecord::Base.connection.execute(sql)
puts 'StopTimes created!'
###############################################################################
