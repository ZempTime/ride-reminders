class CancelAlarmReminders
  def initialize(alarm)
    @alarm = alarm
  end

  def call
    @alarm.reminders.update_all status: "cancelled"
  end
end
