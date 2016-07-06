class SetAlarmRemindersForTodayJob < ApplicationJob
  queue_as :default

  def perform(alarm)
    # Do something later
  end
end
