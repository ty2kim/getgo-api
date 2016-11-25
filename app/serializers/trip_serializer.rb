# class TripSerializer
class TripSerializer < ActiveModel::Serializer
  attributes :id, :route_id, :service_id, :headsign, :short_name, :direction_id,
  :block_id, :shape_id, :wheelchair_accessible, :route_variant,
  :stops, :stop_times

  def stops
    # object.stops if instance_options[:include_stops]
    object.stops if instance_options[:include_stops]
  end

  def stop_times
    object.stop_times if instance_options[:include_stop_times]
  end

  # def api_path
  #   "/agencies/#{agency_id}/routes/#{route_id}/trips/#{object.id}"
  # end

  private

  def agency_id
    scope.params[:agency_id]
  end

  def route_id
    scope.params[:route_id]
  end
end
