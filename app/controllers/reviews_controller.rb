class ReviewsController < ApplicationController
  before_action :find_event, only: [ :show, :new, :create]

  def show
  end

  def new
    @review = Review.new
    authorize @review
  end

   def create
    @review = Review.new(find_params)
    @review.user = current_user
    @review.event_id = @event.id
    authorize @review

    if @review.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
  end

  private

  def find_event
     @event = Event.find(params[:event_id])
  end

  def find_params
    params.require(:review).permit(:rating, :review_content)
  end

end
