class Alarm < ApplicationRecord
  has_one :week, as: :owner
  has_many :reminders
  belongs_to :user
  belongs_to :travel_method
  belongs_to :ride_schedule

  validates :departs_at, :travel_delay_minutes, :heads_up_minutes
end
