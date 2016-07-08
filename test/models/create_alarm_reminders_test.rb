require 'test_helper'

class CreateAlarmRemindersTest < ActiveSupport::TestCase
  test "creates reminder" do
    @alarm = alarms(:alarm_one)

    travel_to Time.new(2016, 7, 6) do
      @reminder_creator = CreateAlarmReminders.new(@alarm)

      assert_difference('Reminder.count') do
        @reminder_creator.call
      end
    end
  end
end
