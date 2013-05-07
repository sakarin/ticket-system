class AddSellerToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :no, :string
    add_column :bookings, :price, :integer
    add_column :bookings, :seller, :string
    add_column :bookings, :completed_at, :datetime
  end
end
