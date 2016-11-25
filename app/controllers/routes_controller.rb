# class RoutesController
class RoutesController < ApplicationController
  before_action :set_agency

  def index
    @routes = @agency.routes

    @service_ids = CalendarDate.service_id_for_date(params[:date]) if params[:date]
    unless @service_ids.blank?
      @routes = Route
      .joins(:trips)
      .where('trips.service_id' => @service_ids)
      .distinct
    end

    render json: @routes, root: 'routes', adapter: :json, each_serializer: RouteSerializer
    # render :json => {@routes, :count => @routes.count}, root: 'routes', adapter: :json, each_serializer: RouteSerializer
  end

  def show
    @route = Route.find(params[:id])
    render json: @route, root: 'route', adapter: :json, include_trips: true
  end

  private

  def set_agency
    @agency = Agency.preload(:routes).find(params[:agency_id])
  end
end
