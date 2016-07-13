class AlarmsController < ApplicationController
  before_action :ensure_ride_schedule_exists, only: [:new]

  def index
    @alarms = alarm_scope.all
  end

  def show
    load_alarm
  end

  def new
    @ride_schedules = ride_schedule_scope.all
    @alarm = alarm_scope.new
    @alarm.build_week
  end

  def edit
    load_alarm
    @ride_schedules = ride_schedule_scope.all
  end

  def create
    @alarm = alarm_scope.new alarm_params

    if @alarm.save
      redirect_to @alarm
    else
      @ride_schedules = ride_schedule_scope.all
      render :new
    end
  end

  def update
    load_alarm

    if @alarm.update alarm_params
      redirect_to @alarm
    else
      @ride_schedules = ride_schedule_scope.all
      render :edit
    end
  end

  def destroy
    load_alarm
    if @alarm.destroy
      redirect_to alarms_path
    else
      render :edit, notice: "We were unable to process your request."
    end
  end

  private
    def alarm_params
      params.require(:alarm).permit(:departs_at, :ride_schedule_id, :travel_delay_minutes, :heads_up_delay_minutes, :travel_method_id, :ride_schedule_id,
                                    week_attributes: [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday])
    end

    def load_alarm
      @alarm = alarm_scope.find(params[:id])
    end

    def alarm_scope
      current_user.alarms
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
