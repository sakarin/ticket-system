class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :route
      t.string :car_standard
      t.integer :seat
      t.integer :price
      t.datetime :Departure
      t.datetime :Arrival
      t.string :company

      t.timestamps
    end
  end
end
