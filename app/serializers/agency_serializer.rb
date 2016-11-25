# class AgencySerializer
class AgencySerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :timezone, :lang, :phone, :fare_url,
  :routes

  def routes
    object.routes if instance_options[:include_routes]
  end

  # def api_path
  #   "/agencies/#{object.id}"
  # end
end
