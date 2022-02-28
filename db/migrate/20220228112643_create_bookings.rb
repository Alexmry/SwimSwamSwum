class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.boolean :confirmed
      t.datetime :start_date
      t.datetime :end_date
      t.references :user, null: false, foreign_key: true
      t.references :pool, null: false, foreign_key: true

      t.timestamps
    end
  end
end
