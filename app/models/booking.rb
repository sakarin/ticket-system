class Booking < ActiveRecord::Base
  attr_accessible :customer_name, :customer_telephone, :number, :pick_up_point, :total, :user_id, :seat, :trip_id

  belongs_to :user

  belongs_to :trip
  has_many :trip_items


  before_validation :generate_number, :on => :create

  def generate_number
    record = true
    while record
      random = "#{Array.new(9){rand(9)}.join}"
      record = self.class.where(:number => random).first
    end
    self.number = random if self.number.blank?
    self.number
  end

  scope :with_state, lambda { |s| where(:state => s) }
  scope :pending, with_state('pending')
  scope :complete, with_state('complete')

  validates_presence_of :customer_name, :on => :update


  # shipment state machine (see http://github.com/pluginaweek/state_machine/tree/master for details)
  state_machine :initial => 'pending', :use_transactions => false do
    event :complete do
      transition :from => 'pending', :to => 'complete'
    end

    #after_transition :to => 'shipped', :do => :after_ship
  end



  #def can_booking(trip_id)
  #   Trip.find(trip_id)
  #end



end
