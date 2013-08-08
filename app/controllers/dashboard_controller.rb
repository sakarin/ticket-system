class DashboardController < ApplicationController
  def index
    @activities = Activity.where(:status => true).order('publishing_at DESC').limit(5)
  end
end