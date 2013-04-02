class Trip < ActiveRecord::Base
  attr_accessible :number, :source_id, :destination_id, :arrival, :departure, :car_standard, :company, :price, :seat

  has_many :trip_items
  has_many :bookings, :through => :trip_items

  belongs_to :source
  belongs_to :destination

  def can_booking(number_of_seats)
    self.seat >= self.trip_items.size + number_of_seats
  end


end
