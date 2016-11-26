# class RoutesController
class RoutesController < ApplicationController
  before_action :set_routes

  def index
    @service_ids = CalendarDate.service_ids_for_date(params[:date]) if params[:date]
    @routes = @routes.joins(:trips).where('trips.service_id' => @service_ids).distinct unless @service_ids.blank?
    render json: @routes, root: 'routes', adapter: :json, each_serializer: RouteSerializer
  end

  def show
    @route = @routes.find(params[:id])
    render json: @route, root: 'route', adapter: :json, include_trips: true
  end

  private

  def set_routes
    @routes = if params[:agency_id]
                Agency.find(params[:agency_id]).routes
              else
                Route.all
              end
  end
end
