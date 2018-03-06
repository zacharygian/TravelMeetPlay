class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :edit, :update, :destroy]

  def index
    @experiences = policy_scope(Experience)
  end

  def show
    authorize @experience
  end

  def new
    @user = current_user
    @experience = Experience.new
    authorize @experience
  end

  def create
    @experience = Experience.new(find_params)
    @experience.user = current_user
    authorize @experience

    if @experience.save
      redirect_to experiences_path
    else
      render :new
    end
  end

  def edit
    authorize @experience
  end

  def update
    @experience.update(find_params)
    authorize @experience
    redirect_to experiences_path
  end

  def destroy
    @experience.destroy
    authorize @experience
    redirect_to experiences_path
  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
  end

  def find_params
    params.require(:experience).permit(:sport_id, :skill_level)
  end
end
