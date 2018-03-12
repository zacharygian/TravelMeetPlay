class PaymentsController < ApplicationController
    before_action :set_order

  def new
    authorize @booking
  end

  def create
    authorize @booking
  end

private

  def set_order
    @booking = Booking.where(status: 'pending').find(params[:booking_id])
  end
end
