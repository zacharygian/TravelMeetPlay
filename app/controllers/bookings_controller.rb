class BookingsController < ApplicationController
  before_action :find_event, only: [ :show, :new, :create, :destroy ]


  def show
  end

  def new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.event = @event
    @booking.user = current_user
    @booking.event_sku = @event.sku
    @booking.amount_cents = @event.price_cents
    @booking.save
    flash[:notice] = "Confirmation request has been sent to the event owner"
    redirect_to new_event_booking_payment_path(@event, @booking)
    authorize @booking
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
    @booking.status = "rejected"
      if @booking.event.spots_left
         @booking.event.spots_left += 1
      else
        @booking.event.spots_left = 0
      end

    @booking.save

    authorize @booking
    flash[:alert] = "You rejected #{@booking.user.first_name} to join the event"
    redirect_to dashboard_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    authorize @booking
    redirect_to dashboard_path
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
    params.permit(:event_id, :status, :rating, :review_content, :price)
  end
end
