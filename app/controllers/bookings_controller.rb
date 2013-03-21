class BookingsController < ApplicationController

  def index
    @search= Trip.search(params[:q])

    # Destroy Temporary Booking
    @booking = Booking.find_by_id_and_state(session[:booking_id], "pending") unless session[:booking_id].blank?
    @booking.destroy unless @booking.nil?

    session[:booking_id] = {}
    session[:seat] = {}
    session[:trip_id] = {}
  end

  def search
    @search = Trip.search(params[:q])
    @departs = @search.result.paginate(:page => params[:page], :per_page => 20)
  end

  def create
    @booking = Booking.new
    @booking.save

    session[:seat] = params[:seat]
    session[:trip_id] = params[:trip_id]
    session[:booking_id] = @booking.id

    redirect_to booking_steps_path

  end

end
