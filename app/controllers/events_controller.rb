class EventsController < ApplicationController
  before_action :set_event, only: [ :show, :edit, :destroy, :update, :delete ]

  def index
    @user = current_user
    @events = policy_scope(Event)
    # @events = Event.all
    @events = policy_scope(Event)
    @markers = @events.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        infoWindow: { content: render_to_string(partial: "/events/map_box", locals: { event: event }) }
      }
    end

    if params[:search].present?
      sql_query = " \
        events.address ILIKE :search \
        OR sports.name ILIKE :search \
      "
      @events = Event.joins(:sport).where(sql_query, search: "%#{params[:search]}%")
    else
       @events = policy_scope(Event)
    end
  end

  def show
    authorize @event
  end

  def dashboard
    @host = current_user
    @events = current_user.events
    @bookings = current_user.bookings
    authorize @events
    authorize @bookings
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.host = current_user
    if @event.save
      redirect_to dashboard_path
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
      address: params[:event][:address],
      date: params[:event][:date],
      max_players: params[:event][:max_players],
      # description: params[:event][:description]
      )
    authorize @event
    redirect_to event_path
  end

  def destroy
    @event.destroy
    authorize @event
    redirect_to dashboard_path
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:address, :date, :max_players, :host_id, :sport_id)
  end
end
