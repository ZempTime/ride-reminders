class Notifier
  def initialize(reminder)
    @reminder = reminder
  end

  def call
    client = Twilio::REST::Client.new

    client.messages.create(
      from: '+13142663572',
      to: @reminder.user.phone_number,
      body: @reminder.message
    )
  end
end
