class BookingStepsController < ApplicationController

  include Wicked::Wizard
  #steps :select_seat, :confirm, :summary
  steps :confirm, :summary

  def show
    @booking = Booking.find(session[:booking_id])
    case step

      when :confirm

        @trip = Trip.find(session[:trip_id])
      when :summary


    end

    render_wizard
  end

  def update
    @booking = Booking.find(session[:booking_id])
    @booking.attributes = params[:booking]

    trip_id = session[:trip_id].to_i
    seat =  session[:seat].to_i
    @trip = Trip.find(trip_id)


    case step
      when :confirm

        if @trip.can_booking(seat)
          @booking.save
          seat.times do |i|
            @booking.trip_items.build(:trip_id => trip_id)
          end
          @booking.complete
          render_wizard @booking
        else
          redirect_to root_url, notice: "You Can't booking."
        end

      when :summary
        render_wizard @booking

    end


  end

  private

  def redirect_to_finish_wizard
    session[:booking_id] = {}
    session[:seat] = {}
    session[:trip_id] = {}

    redirect_to root_url, notice: "Thank you for booking."
  end

end
