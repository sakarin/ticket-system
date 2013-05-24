class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :number
      t.string :route_type
      t.integer :destination_id
      t.string :car_standard
      t.integer :seat
      t.integer :price
      t.datetime :departure
      t.datetime :arrival
      t.integer :company_id
      t.text :description


      t.timestamps
    end
  end
end
