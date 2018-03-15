class UsersController < ApplicationController
  def show
    @user = current_user
    @user_player = User.find(params[:id])
    authorize @user_player
      respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end
end
