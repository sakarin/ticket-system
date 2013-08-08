class Activity < ActiveRecord::Base
  attr_accessible :body, :publishing_at, :status, :title
end
