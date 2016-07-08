require 'test_helper'

class AlarmTest < ActiveSupport::TestCase
  test "creates reminder after update" do
    @alarm = alarms(:alarm_one)

    travel_to Time.new(2016, 7, 6) do
      @alarm.create_reminders
    end
  end
end
