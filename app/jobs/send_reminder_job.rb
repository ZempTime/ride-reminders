class SendReminderJob < ApplicationJob
  queue_as :default

  def perform(reminder)
    Notifier.new(reminder).call
  end
end
