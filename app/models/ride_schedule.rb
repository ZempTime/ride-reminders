class RideSchedule < ApplicationRecord
  belongs_to :travel_method
  has_one :week, dependent: :destroy
end
