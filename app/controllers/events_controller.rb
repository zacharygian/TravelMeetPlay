class EventsController < ApplicationController
  before_action :set_event, only: [ :show, :edit, :destroy, :update, :delete ]

  def index
    @events = policy_scope(Event)
    # @events = Event.all
  end

  def show
    authorize @event
  end

  def dashboard
    @host = current_user
    @events = current_user.events
    authorize @events
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.host = current_user
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end

    authorize @event
  end

  def edit
    authorize @event
  end

  def update
    @event.update(
      location: params[:event][:location],
      date: params[:event][:date],
      max_players: params[:event][:max_players],
      # description: params[:event][:description]
      )
    authorize @event
    redirect_to event_path
  end

  def destroy
    @event.destroy
    redirect_to events_path
    authorize @event
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:location, :date, :max_players, :host_id, :sport_id)
  end
end
