class Notifier
  def initialize(reminder)
    @reminder = reminder
  end

  def call
    client = Twilio::REST::Client.new

    client.messages.create(
      from: '+13145969094',
      to: reminder.user.phone_number,
      body: reminder.message
    )
  end
end
