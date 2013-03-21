class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :source_id
      t.integer :destination_id
      t.string :car_standard
      t.integer :seat
      t.integer :price
      t.datetime :departure
      t.datetime :arrival
      t.string :company

      t.timestamps
    end
  end
end
