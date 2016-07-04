class Reminder < ApplicationRecord
  belongs_to :alarm

  validates :notify_at, :status, presence: true

  enum status: {pending: 0, sent: 1, cancelled: 2}
end
