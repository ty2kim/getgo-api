class Route < ApplicationRecord
  self.primary_key = :id
  belongs_to :agency
  has_many :trips

  def self.filter_by_date(date_in_string)
    where(date.tr('-', ''))
  end

  def self.filter_by_type(type)

  end
end
