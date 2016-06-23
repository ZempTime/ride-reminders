class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.references :user, foreign_key: true, index: true
      t.references :alarm, foreign_key: true, index: true
      t.integer :starts_at
      t.integer :interval
      t.integer :period
      t.text :days, array: true, default: []

      t.timestamps
    end
  end
end
