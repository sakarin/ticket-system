class Company < ActiveRecord::Base
  has_many :users
  has_one :route
  attr_accessible :address, :name, :fax, :tel, :company_type

  scope :companies_act_as_agent, where(:company_type => "agent")
end
