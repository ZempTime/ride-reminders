module DateHelper
  def weekdays
    Date::DAYNAMES.each_with_index.map { |d, i| Weekday.new(d, i) }
  end

  class Weekday
    attr_accessor :name, :index
    def initialize(name, index)
      @name = name
      @index = index
    end
  end
end
