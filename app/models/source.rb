class Source < ActiveRecord::Base
  attr_accessible :name

  has_many :trips

  validates_presence_of :name
end
