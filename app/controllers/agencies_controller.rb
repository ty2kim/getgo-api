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
end
