class BookingStepsController < ApplicationController
  before_filter :load_booking

  include Wicked::Wizard
  steps :customer, :summary

  def show
    render_wizard
  end

  def update
    case step
      when :customer
        if params[:btn_next]
          @booking.update_attributes(params[:booking])
          @booking.seat.times do |i|
            @booking.booking_items.build
          end
          @booking.complete
          render_wizard @booking
        else
          redirect_to search_bookings_path
        end
      when :summary
        redirect_to_finish_wizard

    end
  end

  private
  def load_booking
    begin
      @booking = Booking.find(session[:booking_id])
      @booking.user_id = current_user.id

      @route = Route.find(@booking.route_id)
    rescue
      redirect_to search_bookings_path, alert: t('notice.booking.fail')
    end
  end

  def redirect_to_finish_wizard
    session[:booking_id] = {}
    session[:seat] = {}
    session[:route_id] = {}
    redirect_to root_url, notice: t('notice.booking.complete')
  end
end
