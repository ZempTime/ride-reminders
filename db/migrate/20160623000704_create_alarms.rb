class CreateAlarms < ActiveRecord::Migration[5.0]
  def change
    create_table :alarms do |t|
      t.references :user, foreign_key: true
      t.references :schedule, foreign_key: true
      t.datetime :departs_at
      t.integer :travel_method
      t.integer :travel_delay
      t.integer :heads_up_delay
      t.text :recurs_on, array: true, default: []

      t.timestamps
    end
  end
end
