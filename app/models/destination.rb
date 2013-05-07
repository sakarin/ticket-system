# == Schema Information
#
# Table name: destinations
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Destination < ActiveRecord::Base
  attr_accessible :name

  has_many :routes
end
