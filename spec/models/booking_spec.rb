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

require 'spec_helper'

describe Booking do
  pending "add some examples to (or delete) #{__FILE__}"
end
