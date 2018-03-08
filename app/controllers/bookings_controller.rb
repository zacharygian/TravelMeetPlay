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
    params.permit(:event_id)
  end
end
