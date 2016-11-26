# class Agency
class Agency < ApplicationRecord
  self.primary_key = :id
  has_many :routes
end
