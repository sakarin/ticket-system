class Report::CompaniesController < ApplicationController
  def index
    @search = Booking.search(params[:q])

  end

  def search
    validate_form

    @search = Booking.complete.search(params[:q])
    @bookings = @search.result.paginate(:page => params[:page], :per_page => 20).order('created_at DESC')
    session[:q] = params[:q]

  end

  private

  def validate_form
    if params[:q][:route_departure_at_casted_gteq].blank? || params[:q][:route_departure_at_casted_lteq].blank?
      flash[:error] = "your search criteria is invalid. Please try using valid keywords"
      redirect_to report_companies_path
      return
    end

  end

end
