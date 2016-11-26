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
end
