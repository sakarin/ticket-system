# == Schema Information
#
# Table name: bookings
#
#  id                 :integer          not null, primary key
#  route_id           :integer
#  number             :string(255)
#  total              :string(255)
#  pick_up_point      :string(255)
#  customer_name      :string(255)
#  customer_telephone :string(255)
#  seat               :integer
#  state              :string(255)
#  user_id            :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  no                 :string(255)
#  price              :integer
#  seller             :string(255)
#  completed_at       :datetime
#

class Booking < ActiveRecord::Base
  attr_accessible :customer_name, :customer_telephone, :number, :pick_up_point, :total, :user_id, :seat, :route_id
  attr_accessible :no, :price, :completed_at



  belongs_to :user

  belongs_to :route
  has_many :booking_items


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

  validates_presence_of :customer_name, :no, :price, :on => :update


  # shipment state machine (see http://github.com/pluginaweek/state_machine/tree/master for details)
  state_machine :initial => 'pending', :use_transactions => false do
    event :complete do
      transition :from => 'pending', :to => 'complete'
    end

    after_transition :to => 'complete', :do => :after_complete
  end

  def after_complete
    touch :completed_at
  end

  ransacker :created_at_casted do |parent|
    Arel::Nodes::SqlLiteral.new("date(bookings.created_at)")
  end



end
