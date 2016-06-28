module AlarmsHelper
  def weekdays
    weekdays = Date::DAYNAMES.rotate(1) # makes Monday first day of week
  end
end
