class CreateBookingItems < ActiveRecord::Migration
  def change
    create_table :booking_items do |t|
      t.integer :booking_id
      t.integer :price
      t.string :seat_number

      t.timestamps
    end
  end
end
