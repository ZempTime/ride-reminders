class Alarm < ApplicationRecord
  has_one :week, as: :owner, dependent: :destroy
  has_many :reminders, dependent: :destroy
  #belongs_to :user
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

  private
    def set_reminders
      SetAlarmRemindersForTodayJob.perform_later(alarm)
    end

    def cancel_existing_reminders
    end

    def create_new_reminders
      CreateAlarmReminders.new(self).call
    end
end
