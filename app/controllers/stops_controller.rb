# class StopsController
class StopsController < ApplicationController
  before_action :set_stops

  def index
    render json: @stops, root: 'stops', adapter: :json, each_serializer: StopSerializer
  end

  def show
    @stop = Stop.find params[:id]
    render json: @stop, root: 'stop', adapter: :json, include_trips: true, include_stop_times: true
  end

  private

  def set_stops
    @stops = if params[:trip_id]
               Trip.find(params[:trip_id]).stops
             else
               @service_ids = CalendarDate.service_ids_for_date(params[:date]) if params[:date]
               if @service_ids.blank?
                 Stop.all
               else
                 Stop.joins(:trips).where('trips.service_id' => @service_ids).distinct
               end
             end
  end
end
