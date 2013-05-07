# == Schema Information
#
# Table name: booking_items
#
#  id          :integer          not null, primary key
#  booking_id  :integer
#  price       :integer
#  seat_number :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class BookingItem < ActiveRecord::Base
  attr_accessible :booking_id, :price, :seat_number

  belongs_to :booking

end
