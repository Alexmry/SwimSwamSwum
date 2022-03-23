class CreateBookingNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :booking_notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :booking, null: false, foreign_key: true
      t.boolean :seen, null: false, default: false

      t.timestamps
    end
  end
end
