class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :description
      t.integer :slots_count
      t.integer :user_id

      t.timestamps
    end
  end
end
