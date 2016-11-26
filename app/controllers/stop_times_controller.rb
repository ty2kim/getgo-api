# class StopTimesController
class StopTimesController < ApplicationController
  before_action :set_parent
  def index
    @stop_times = @parent.stop_times
    render json: @stop_times, root: 'stop_times', adapter: :json
  end

  private

  def set_parent
    if params[:trip_id]
      @parent = Trip.preload(:stops).find_by(id: params[:trip_id])
    elsif params[:stop_id]
      @parent = Stop.preload(:stops).find_by(id: params[:stop_id])
    end
  end
end
