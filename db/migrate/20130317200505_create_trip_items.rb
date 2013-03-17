class CreateTripItems < ActiveRecord::Migration
  def change
    create_table :trip_items do |t|
      t.integer :booking_id
      t.string :trip_id
      t.integer :price
      t.string :seat_number

      t.timestamps
    end
  end
end
