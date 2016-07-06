class Week < ApplicationRecord
  belongs_to :owner, polymorphic: true, required: false

  def abbreviated_weekdays
    result = ""
    result += "S" if sunday
    result += "M" if monday
    result += "T" if tuesday
    result += "W" if wednesday
    result += "H" if thursday
    result += "F" if friday
    result += "S" if saturday

    case result
    when "MTWHF"
      return "Weekdays"
    when "SS"
      return "Weekends"
    else
      result
    end
  end
end
