class BookingStepsController < ApplicationController
  before_filter :load_data


  include Wicked::Wizard
  #steps :select_seat, :confirm, :summary
  steps :confirm, :summary

  def show
    render_wizard
  end

  def update

    case step
      when :confirm
        if params[:btn_next]
          if @trip.can_booking(@booking.seat)
            @booking.update_attributes(params[:booking])
            @booking.seat.times do |i|
              @booking.trip_items.build
            end
            @booking.complete
            render_wizard @booking
          else
            redirect_to root_url, alert: "You Can't booking."
          end
        else
          redirect_to search_bookings_path
        end

      when :summary
        render_wizard @booking
    end


  end


  private

  def load_data
    begin
      @booking = Booking.find(session[:booking_id])
      @trip = Trip.find(@booking.trip_id)
    rescue
      redirect_to search_bookings_path, alert:  "You Can't booking."
    end

  end


  def redirect_to_finish_wizard
    session[:booking_id] = {}
    session[:seat] = {}
    session[:trip_id] = {}

    redirect_to root_url, notice: "Thank you for booking."
  end

end
