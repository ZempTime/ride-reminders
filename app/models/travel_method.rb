class TravelMethod < ApplicationRecord
  has_many :ride_schedules

  validates_presence_of :name, :description
end
