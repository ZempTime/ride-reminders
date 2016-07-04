class CreateRideSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :ride_schedules do |t|
      t.references :travel_method, foreign_key: true
      t.time :starts_at
      t.integer :interval_minutes

      t.timestamps
    end
  end
end
