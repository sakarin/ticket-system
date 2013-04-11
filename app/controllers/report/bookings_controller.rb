class Report::BookingsController < ApplicationController
  def index
    @search = Booking.search(params[:q])
    @bookings = @search.result.paginate(:page => params[:page], :per_page => 20).order('created_at DESC')
  end

  def show
    @booking = Booking.find(params[:id])
    @trip = @booking.trip
  end

  def report


    @booking = Booking.find(params[:id])
    @trip = @booking.trip
    render layout: 'report'
  end
end
