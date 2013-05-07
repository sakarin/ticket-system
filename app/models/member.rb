# == Schema Information
#
# Table name: members
#
#  id         :integer          not null, primary key
#  tat_no     :string(255)
#  address    :text
#  website    :string(255)
#  telephone1 :string(255)
#  telephone2 :string(255)
#  fax        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Member < ActiveRecord::Base
  attr_accessible :address, :fax, :tat_no, :telephone1, :telephone2, :website
end
