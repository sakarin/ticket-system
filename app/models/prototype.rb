# == Schema Information
#
# Table name: prototypes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


#

class Prototype < ActiveRecord::Base
  attr_accessible :name, :company_id

  has_many :routes
  belongs_to :company

  scope :with_company, lambda { |user| where(:company_id => user.company_id) }
end
