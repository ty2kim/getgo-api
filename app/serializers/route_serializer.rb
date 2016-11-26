# class RouteSerializer
class RouteSerializer < ActiveModel::Serializer
  attributes :id, :agency_id, :short_name, :long_name,
            :color, :text_color, :trips

  def trips
    object.trips if instance_options[:include_trips]
  end
end
