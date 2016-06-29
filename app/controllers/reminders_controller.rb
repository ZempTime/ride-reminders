class RemindersController < ApplicationController
  def index
  end

  def new
    @reminder = Reminder.new
  end
end
