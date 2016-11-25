# class TripsController
class TripsController < ApplicationController
  before_action :set_parent
  # before_action :set_route
  def index
    @trips = @parent.trips
    # @trips = @route.trips

    @service_ids = CalendarDate.service_id_for_date(params[:date]) if params[:date]

    unless @service_ids.blank?
      # @trips = @route.trips
      @trips = @parent.trips
      .where(service_id: @service_ids)
    end

    render json: @trips, root: 'trips', adapter: :json, each_serializer: TripSerializer
    # render json: @trips
  end

  def show
    @trip = Trip.find(params[:id])
    # render json: @trip, root: 'trip', adapter: :json, include_stops: true
    render json: @trip, root: 'trip', adapter: :json, include_stops: true, include_stop_times: true

  end

  private

  def set_parent
    if params[:route_id]
      @parent = Route.preload(:trips).find_by(id: params[:route_id])
    elsif params[:stop_id]
      @parent = Stop.preload(:trips).find_by(id: params[:stop_id])
    # render json: {errors: ["Route #{params[:route_id]} does not exist"]}, status: :not_found
    end
  end

  # def set_route
  #   @route = Route.preload(:trips).find_by(id: params[:route_id])
  # end

end
