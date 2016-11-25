class Stop < ApplicationRecord
  self.primary_key = :id
  has_many :stop_times
  has_many :trips, through: :stop_times
end
