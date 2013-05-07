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

require 'spec_helper'

describe Member do
  pending "add some examples to (or delete) #{__FILE__}"
end
