# == Schema Information
#
# Table name: routes
#
#  id             :integer          not null, primary key
#  number         :string(255)
#  route_type     :string(255)
#  destination_id :integer
#  car_standard   :string(255)
#  seat           :integer
#  price          :integer
#  departure      :datetime
#  arrival        :datetime
#  company_id     :integer
#  description    :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  prototype_id   :integer
#

class Route < ActiveRecord::Base
  attr_accessible :number, :destination_id, :arrival, :departure, :car_standard, :company_id, :price, :seat, :route_type, :description, :prototype_id



  belongs_to :company
  belongs_to :prototype

  has_many :bookings, :conditions => "state LIKE 'complete'"

  validates_presence_of :route_type, :destination, :car_standard, :seat, :price

  #default_scope order('departure DESC')

  scope :with_company, lambda { |user| where(:company_id => user.company_id) }

  belongs_to :destination

  before_validation :generate_number, :on => :create

  def can_booking(number_of_seats)
    self.seat >= self.bookings.sum(:seat) + number_of_seats
  end



  def check_before_date
    self.departure > 3.hours.ago
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

  ransacker :created_at_casted do |parent|
    Arel::Nodes::SqlLiteral.new("date(routes.created_at)")
  end

  ransacker :departure_at_casted do |parent|
    Arel::Nodes::SqlLiteral.new("date(routes.departure)")
  end


  def duplicate(d)
    route = self.dup
    route.created_at = route.updated_at = touch
    route.prototype = nil

    days = Date.parse(d) - self.departure.to_date

    route.departure += days.day
    route.arrival += days.day

    route.save
    route
  end

end
