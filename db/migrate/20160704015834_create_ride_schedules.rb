class CreateRideSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :ride_schedules do |t|
      t.references :user, foreign_key: true, index: true
      t.references :travel_method, foreign_key: true
      t.time :starts_at, null: false
      t.integer :interval_minutes, null: false

      t.timestamps
    end
  end
end
