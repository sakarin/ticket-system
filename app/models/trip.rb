class Trip < ActiveRecord::Base
  attr_accessible :Arrival, :Departure, :car_standard, :company, :price, :route, :seat
end
