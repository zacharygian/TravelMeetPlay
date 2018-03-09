class BookingsController < ApplicationController
  before_action :find_event, only: [ :show, :new, :create ]


  def show
  end

  def new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.event = @event
    @booking.user = current_user
    @booking.save
    @event.spots_left = @event.spots_left - 1
    @event.save
    authorize @booking
    flash[:notice] = "Congratulations, you successfully joined the game!"
    redirect_to events_path
  end

  def edit
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.status = "approved"
    @booking.save
    authorize @booking
    flash[:notice] = "You approved #{@booking.user.first_name} to join the event"
    redirect_to dashboard_path
  end

  def update_denial
    @booking = Booking.find(params[:booking_id])
    @booking.status = "denied"
      if @booking.event.spots_left
         @booking.event.spots_left += 1
      else
        @booking.event.spots_left = 0
      end

    @booking.save

    authorize @booking
    flash[:alert] = "You denied #{@booking.user.first_name} to join the event"
    redirect_to dashboard_path
  end

  def destroy
  end


private

  def find_event
    @event = Event.find(params[:event_id])
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    user_id = current_user.id
    params.permit(:event_id, :status)
  end
end
