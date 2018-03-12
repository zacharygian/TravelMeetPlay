class PaymentsController < ApplicationController
    before_action :set_order

  def new
    authorize @order
  end

  def create
    authorize @order
  end

private

  def set_order
    @order = Order.where(state: 'pending').find(params[:order_id])
  end
end
