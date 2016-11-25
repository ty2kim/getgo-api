# class AgenciesController
class AgenciesController < ApplicationController
  def index
    @agencies = Agency.all
    render json: @agencies, root: 'agencies', adapter: :json, each_serializer: AgencySerializer
  end

  def show
    @agency = Agency.find(params[:id])
    render json: @agency, root: 'agency', adapter: :json, include_routes: true
  end

  # def show
  #   @agency = Agency.first
  #   render json: generate_agency_json(@agency) if @agency
  # end
  #
  # private
  #
  # def generate_agency_json(agency)
  #   agency_json = agency.attributes
  #   agency_json['routes'] = agency.routes
  #   { agency: agency_json }
  # end
end
