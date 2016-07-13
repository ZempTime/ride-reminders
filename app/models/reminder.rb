class Reminder < ApplicationRecord
  belongs_to :alarm

  validates :notify_at, :status, presence: true

  enum status: {pending: 0, sent: 1, cancelled: 2}

  after_create :schedule_job

  def schedule_job
    SendReminderJob.set(wait_until: notify_at).perform_later(self)
  end

  def user
    alarm.user
  end
end
