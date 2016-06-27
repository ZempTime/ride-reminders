class AlarmsController < ApplicationController
  def index
  end

  def new
    @alarm = Alarm.new
  end
end
