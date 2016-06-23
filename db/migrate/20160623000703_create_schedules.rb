class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.integer :starts_at
      t.integer :interval
      t.integer :period
      t.text :days, array: true, default: []

      t.timestamps
    end
  end
end
