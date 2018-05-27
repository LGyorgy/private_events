module SessionsHelper

  # Log in the given user
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the currently logged in user
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Check if any user is logged in
  def logged_in?
    !current_user.nil?
  end
end
