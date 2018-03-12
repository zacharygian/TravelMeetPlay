class OrdersController < ApplicationController

  def create
    event = Event.find(params[:event_id])
    order  = Order.create!( amount: event.price, state: 'pending')

    redirect_to  new_event_order_payment_path(event, order)
    authorize order
  end

end
