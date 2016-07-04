class RideSchedule < ApplicationRecord
  belongs_to :travel_method
  has_one :week, dependent: :destroy
  has_many :alarms

  validates :starts_at, :interval_minutes, presence: true
end
