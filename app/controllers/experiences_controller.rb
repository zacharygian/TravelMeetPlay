class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :create, :edit, :update, :destroy]

  def index
    @experiences = Experience.all
  end

  def show
  end

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(find_params)
    @experience.user = current_user
    @experience.save
  end

  def edit
  end

  def update
    @experience.update(find_params)
  end

  def destroy
    @experience.destroy
  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
  end

  def find_params
    params.require(:experience).permit(:user_id, :sport_id, :skill_level)
  end

end
