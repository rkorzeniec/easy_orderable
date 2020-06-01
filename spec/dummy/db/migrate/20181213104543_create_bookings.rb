# frozen_string_literal: true
class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :slots_count
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
