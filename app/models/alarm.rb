class Alarm < ApplicationRecord
  has_one :week, as: :owner, dependent: :destroy
  has_many :reminders, dependent: :destroy
  #belongs_to :user
  #belongs_to :travel_method
  belongs_to :ride_schedule

  validates :departs_at, :travel_delay_minutes, :heads_up_delay_minutes, presence: true
end
