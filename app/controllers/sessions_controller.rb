class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email])
    if user
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash.now[:error] = "No such user"
    end
  end

  def new
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
