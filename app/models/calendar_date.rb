# class CalendarDate
class CalendarDate < ApplicationRecord
  # lambda
  scope :service_id_for_date, lambda { |date|
    where(date: date).pluck(:service_id) if date
  }
end
