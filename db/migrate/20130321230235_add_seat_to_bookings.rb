class AddSeatToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :session_seat, :integer
    add_column :bookings, :session_trip_id, :integer
  end
end
