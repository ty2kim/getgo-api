# class StopTime
class StopTime < ApplicationRecord
  belongs_to :stop
  belongs_to :trip
end
