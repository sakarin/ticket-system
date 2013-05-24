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
    validate_form

    if session[:q].blank?
      @search = Route.search(params[:q])
      session[:q] = params[:q]
    else
      @search = Route.search(session[:q])
    end
    @departs = @search.result.paginate(:page => params[:page], :per_page => 20)

    unless params[:seat].nil?
      session[:seat] = params[:seat][:number]
    end

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

  private

  def validate_form
    if params[:q][:departure_at_casted_date_equals].blank? || params[:q][:route_type_cont].blank?
      flash[:error] = "your search criteria is invalid. Please try using valid keywords"
      redirect_to bookings_path
      return
    end

  end

end
