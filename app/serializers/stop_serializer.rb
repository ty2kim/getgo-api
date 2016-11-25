# class StopSerializer
class StopSerializer < ActiveModel::Serializer
  attributes :id, :name, :lat, :lon, :zone_id, :url, :location_type,
  :parent_station, :wheelchair_boarding, :stop_times, :trips

  def stop_times
    object.stop_times if instance_options[:include_stop_times]
  end

  def trips
    object.trips if instance_options[:include_trips]
  end

  # def api_path
  #   "/agencies/#{agency_id}/routes/#{route_id}/trips/#{trip_id}/stops/#{object.id}"
  # end

  private

  def agency_id
    scope.params[:agency_id]
  end

  def route_id
    scope.params[:route_id]
  end

  def trip_id
    scope.params[:trip_id]
  end
end
