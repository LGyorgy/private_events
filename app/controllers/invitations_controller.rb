class InvitationsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
  end

  def create
    event      = Event.find(params[:event_id])
    user       = User.find_by(email: params[:email])
    if user
      invitation = event.invitations.build(inviter_id:      current_user.id,
                                           invited_user_id: user.id,
                                           event_id:        event.id)
      if invitation.save
        redirect_to event_path(event)
      else
        redirect_to new_invitation_path(event.id)
      end
    else
      redirect_to new_invitation_path(event.id)
    end
  end

  def index
    @user        = User.find(params[:id])
    @invitations = @user.received_invitations
  end
end
