# class StopTimeSerializer
class StopTimeSerializer < ActiveModel::Serializer
  attributes :id, :trip_id, :stop_id, :arrival_time, :departure_time,
  :stop_sequence, :pickup_type, :drop_off_type

  private

  def agency_id
    scope.params[:agency_id]
  end

  def route_id
    scope.params[:route_id]
  end

  def trip_id
    scope.params[:trip_id]
  end
end
