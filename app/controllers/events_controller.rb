class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    user = current_user
    if !user
      flash[:error] = "You must be logged in to make an Event!"
      redirect_to login_path
    else
      event = user.events.build(event_params)
      if event.save
        redirect_to user_path(current_user)
      else
        flash.now[:error] = "Unsuccesful event creation"
        render 'new'
      end
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @past_events   = Event.past
    @future_events = Event.future
  end

  private

    def event_params
      params.require(:event).permit(:description, :date, :location, :title)
    end
end
