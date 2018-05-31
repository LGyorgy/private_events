class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render "new"
    end
  end

  def show
    @user            = User.find(params[:id])
    @upcoming_events = @user.upcoming_events
    @previous_events = @user.previous_events
    @attended_events = @user.attended_events
    rescue ActiveRecord::RecordNotFound
      flash[:error] = "Non-existent user profile"
      redirect_to root_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email)
    end
end
