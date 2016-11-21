class StopTimesController < ApplicationController
  def index
    @stop_times = StopTime.all
    render json: @stop_times
  end

  def show
    @stop_time = StopTime.find params[:id]
    render json: @stop_time
  end
end
