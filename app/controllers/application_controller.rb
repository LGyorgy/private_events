class ApplicationController < ActionController::Base
  private

    def current_user
      if session[:user_id]
        return User.find_by(id: session[:user_id])
      else
        return nil
      end
    end
end
