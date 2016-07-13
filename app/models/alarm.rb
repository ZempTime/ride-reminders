class Alarm < ApplicationRecord
  has_one :week, as: :owner, dependent: :destroy
  has_many :reminders, dependent: :destroy
  belongs_to :user
  #belongs_to :travel_method
  belongs_to :ride_schedule

  validates :departs_at, :travel_delay_minutes, :heads_up_delay_minutes, presence: true
  validates_presence_of :week

  accepts_nested_attributes_for :week, allow_destroy: true, reject_if: :all_blank

  after_save :set_reminders

  def travel_method
    ride_schedule.travel_method
  end

  def title
    "#{travel_method.name} #{abbreviated_weekdays} at #{departs_at_display}"
  end

  def departs_at_display
    departs_at.strftime("%l:%M %p")
  end

  def abbreviated_weekdays
    week.abbreviated_weekdays
  end

  def travel_delay
    travel_delay_minutes.minutes
  end

  def heads_up_delay
    heads_up_delay_minutes.minutes
  end

  private
    def set_reminders
      cancel_existing_reminders
      create_new_reminders
    end

    def cancel_existing_reminders
      CancelAlarmReminders.new(self).call
    end

    def create_new_reminders
      CreateAlarmReminders.new(self).call
    end
end
