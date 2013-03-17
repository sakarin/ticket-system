class TripItem < ActiveRecord::Base
  attr_accessible :booking_id, :price, :seat_number, :trip_id

  belongs_to :trip
  belongs_to :booking
end
