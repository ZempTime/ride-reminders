class CreateAlarmReminders
  def initialize(alarm)
    @alarm = alarm
    @ride_schedule = alarm.ride_schedule
  end

  def call
    return false unless alarm_runs_today?

    arrive_at_time = @ride_schedule.next_departure(@alarm.departs_at)
    arrive_at = DateTime.now.at_beginning_of_day + arrive_at_time.seconds_since_midnight.seconds
    leave_at = arrive_at - @alarm.travel_delay
    heads_up_at = leave_at - @alarm.heads_up_delay

    ActiveRecord::Base.transaction do
      @alarm.reminders.create(notify_at: leave_at, status: "pending", message: "Head out to make your ride at #{arrive_at.strftime("%l:%M %p")}")
      @alarm.reminders.create(notify_at: heads_up_at, status: "pending", message: "#{@alarm.heads_up_delay_minutes} minute heads up! You'll need to leave soon to leave at #{leave_at.strftime("%l:%M %p")} to make your ride!")
    end
  end

  private
    def alarm_runs_today?
      weekday = DateTime.now.strftime("%A").downcase
      @alarm.week.send(weekday)
    end
end
