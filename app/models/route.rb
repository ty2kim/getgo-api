# class Route
class Route < ApplicationRecord
  self.primary_key = :id
  belongs_to :agency
  has_many :trips
end
