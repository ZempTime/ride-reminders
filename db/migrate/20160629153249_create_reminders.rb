class CreateReminders < ActiveRecord::Migration[5.0]
  def change
    create_table :reminders do |t|
      t.references :user, foreign_key: true, index: true
      t.references :ride_schedule, foreign_key: true, index: true
      t.datetime :departs_at
      t.integer :travel_method
      t.integer :travel_delay
      t.integer :heads_up_delay
      t.text :recurs_on

      t.timestamps
    end
  end
end
