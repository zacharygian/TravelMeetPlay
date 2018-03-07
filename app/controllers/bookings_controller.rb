class BookingsController < ApplicationController
  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.event = @event
    @booing.user = current_user
    @booking.save
    authorize @booking
    redirect_to event_path
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
    user_id = current_user.user_id
    params.require(:booking).permit(:user_id, :event_id)
  end
end
