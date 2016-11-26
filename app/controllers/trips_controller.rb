# class TripsController
class TripsController < ApplicationController
  before_action :set_trips
  def index
    @service_ids = CalendarDate.service_ids_for_date(params[:date]) if params[:date]
    @trips = @trips.where(service_id: @service_ids) unless @service_ids.blank?

    render json: @trips, root: 'trips', adapter: :json, each_serializer: TripSerializer
  end

  def show
    @trip = @trips.find(params[:id])
    render json: @trip, root: 'trip', adapter: :json, include_stops: true, include_stop_times: true
  end

  private

  def set_trips
    @trips = if params[:route_id]
               Route.find(params[:route_id]).trips
             elsif params[:stop_id]
               Stop.find(params[:stop_id]).trips
             else
               Trip.all
             end
  end
end
