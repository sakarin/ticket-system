class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :number
      t.string :total
      t.string :pick_up_point
      t.string :customer_name
      t.string :customer_telephone
      t.integer :user_id

      t.timestamps
    end
  end
end
