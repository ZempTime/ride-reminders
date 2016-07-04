class CreateReminders < ActiveRecord::Migration[5.0]
  def change
    create_table :reminders do |t|
      t.datetime :notify_at
      t.integer :status, default: 0
      t.references :alarm, foreign_key: true
      t.string :message

      t.timestamps
    end
  end
end
