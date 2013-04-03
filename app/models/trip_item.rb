class TripItem < ActiveRecord::Base
  attr_accessible :booking_id, :price, :seat_number

  belongs_to :booking
  #belongs_to :trip
  #belongs_to :booking
end
