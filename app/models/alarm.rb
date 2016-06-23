class Alarm < ApplicationRecord
  belongs_to :user
  has_one :schedule
end
