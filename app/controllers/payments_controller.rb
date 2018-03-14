class PaymentsController < ApplicationController
    before_action :set_order

  def new
    authorize @booking
  end

  def create
    authorize @booking
    flash[:notice] = "Confirmation request has been sent to the event owner"
    redirect_to dashboard_path
  end

private

  def set_order
    @booking = Booking.where(status: 'pending').find(params[:booking_id])
  end
end
