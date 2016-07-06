class AlarmsController < ApplicationController
  before_action :ensure_ride_schedule_exists, only: [:new]

  def index
  end

  def new
    @ride_schedules = ride_schedule_scope.all
    @alarm = alarm_scope.new
    @alarm.build_week
  end

  def create
    @alarm = Alarm.new alarm_params

    if @alarm.save
      redirect_to @alarm
    else
      @ride_schedules = ride_schedule_scope.all
      render :new
    end
  end

  private
    def alarm_params
      params.require(:alarm).permit(:departs_at, :ride_schedule_id, :travel_delay_minutes, :heads_up_delay_minutes, :travel_method_id, :ride_schedule_id,
                                    week_attributes: [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday])
    end

    def alarm_scope
      Alarm
    end

    def ensure_ride_schedule_exists
      unless ride_schedule_scope.any?
        redirect_to new_ride_schedule_path, notice: "Set up a ride schedule you'll build an alarm from!"
      end
    end

    def ride_schedule_scope
      RideSchedule
    end
end
