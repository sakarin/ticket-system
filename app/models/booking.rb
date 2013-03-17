class Booking < ActiveRecord::Base
  attr_accessible :customer_name, :customer_telephone, :number, :pick_up_point, :total, :user_id

  belongs_to :user
  has_many :trip_items
end
