module AlarmsHelper
  def weekdays
    weekdays = Date::DAYNAMES.rotate(1).each_with_index.map { |d, i| Weekday.new(d, i) } # makes Monday first day of week
  end

  class Weekday
    attr_accessor :name, :index
    def initialize(name, index)
      @name = name
      @index = index
    end
  end
end
