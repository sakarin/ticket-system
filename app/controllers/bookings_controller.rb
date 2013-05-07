class BookingsController < ApplicationController

  def index
    @search= Route.search(params[:q])

    # Destroy Temporary Booking
    @booking = Booking.find_by_id_and_state(session[:booking_id], "pending") unless session[:booking_id].blank?
    @booking.destroy unless @booking.nil?

    session[:q] = {}
    session[:last_page] = {}
    session[:seat] = {}

  end

  def search
    if session[:q].blank?
      @search = Route.search(params[:q])
    else
      @search = Route.search(session[:q])
    end
    @departs = @search.result.paginate(:page => params[:page], :per_page => 20)

    unless params[:seat].nil?
      session[:seat] = params[:seat][:number]
    end
    session[:q] = params[:q]
  end

  def create

    if params[:btn_next]
      @route = Route.find(params[:route_id])
      if @route.check_before_date
        @booking = Booking.create(:seat => session[:seat], :user_id => current_user.id, :route_id => params[:route_id])
        session[:booking_id] = @booking.id
        redirect_to booking_steps_path
      else
        redirect_to :back, :alert => "before 3 H"
      end
    else
      redirect_to bookings_path
    end


  end

end
