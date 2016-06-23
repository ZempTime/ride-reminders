class Schedule < ApplicationRecord
  belongs_to :alarm
  belongs_to :user
end
