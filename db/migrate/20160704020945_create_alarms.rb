class CreateAlarms < ActiveRecord::Migration[5.0]
  def change
    create_table :alarms do |t|
      t.references :user, foreign_key: true
      t.time :departs_at
      t.integer :travel_delay_minutes
      t.integer :heads_up_delay_minutes
      t.references :travel_method, foreign_key: true
      t.references :ride_schedule, foreign_key: true

      t.timestamps
    end
  end
end
