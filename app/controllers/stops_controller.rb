# class StopsController
class StopsController < ApplicationController
  # before_action :set_trip

  def index
    # @stops = Stop.all
    if params[:trip_id]
      @stops = Trip.find_by(id: params[:trip_id]).stops
    else
      @stops = Stop.all
      @service_ids = CalendarDate.service_id_for_date(params[:date]) if params[:date]
      # unless @service_ids.blank?
      #   @stops = @stops
      #   .joins(:trips)
      #   .where('trips.service_id' => @service_ids)
      #   .distinct
      # end
    end

    # @stops.where("'id NOT LIKE '%-parent'")
    render json: @stops, root: 'stops', adapter: :json, each_serializer: StopSerializer
  end

  def show
    @stop = Stop.find params[:id]
    # render json: @stop, root: 'stop', adapter: :json, include_trips: true
    render json: @stop, root: 'stop', adapter: :json, include_trips: true, include_stop_times: true
  end

  # private

  # def set_route
  #   @route = Route.find_by(id: params[:route_id])
  # end

  # def set_trip
  #   @trip = Trip.preload(:stops).find_by(id: params[:trip_id])
  # end
end
