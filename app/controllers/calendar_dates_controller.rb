# class CalendarDatesController
class CalendarDatesController < ApplicationController
  def index
    @calendar_dates = CalendarDate.all
    render json: @calendar_dates
  end

  def show
    @calendar_date = CalendarDate.find params[:id]
    render json: @calendar_date
  end
end
