class Member < ActiveRecord::Base
  attr_accessible :address, :fax, :tat_no, :telephone1, :telephone2, :website
end
