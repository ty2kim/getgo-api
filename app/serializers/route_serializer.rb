# class RouteSerializer
class RouteSerializer < ActiveModel::Serializer
  attributes :id, :agency_id, :short_name, :long_name,
            :color, :text_color, :trips

  def trips
    object.trips if instance_options[:include_trips]
  end

  # def api_path
  #   "/agencies/#{agency_id}/routes/#{object.id}"
  # end

  def agency_id
    scope.params[:agency_id]
  end
end
