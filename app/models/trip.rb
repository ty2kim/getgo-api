class Trip < ApplicationRecord
  self.primary_key = :id
  belongs_to :route
  has_many :stops, through: :stop_times
end
