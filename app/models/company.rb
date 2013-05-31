# == Schema Information
#
# Table name: companies
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  address      :text
#  tel          :string(255)
#  fax          :string(255)
#  company_type :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Company < ActiveRecord::Base
  has_many :users
  has_one :route
  has_many :prototypes

  attr_accessible :address, :name, :fax, :tel, :company_type

  scope :companies_act_as_agent, where(:company_type => "agent")
end
