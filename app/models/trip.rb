class Trip < ActiveRecord::Base
  attr_accessible :number, :source_id, :destination_id, :arrival, :departure, :car_standard, :company, :price, :seat


  has_many :bookings, :conditions => "state LIKE 'complete'"

  validates_presence_of :source, :destination, :car_standard, :seat, :price, :company

  belongs_to :source
  belongs_to :destination

  before_validation :generate_number, :on => :create

  def can_booking(number_of_seats)
    self.seat >= self.bookings.sum(:seat) + number_of_seats
  end

  def generate_number
    record = true
    while record
      random = "#{Array.new(9){rand(9)}.join}"
      record = self.class.where(:number => random).first
    end
    self.number = random if self.number.blank?
    self.number
  end


end
