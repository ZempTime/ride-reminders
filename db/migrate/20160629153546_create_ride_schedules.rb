class CreateRideSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :ride_schedules do |t|
      t.integer :starts_at
      t.integer :interval
      t.integer :period
      t.text :days

      t.timestamps
    end
  end
end
