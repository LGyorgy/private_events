class AttendancesController < ApplicationController
  def create
    invitation = Invitation.find(params[:id])
    if invitation
      attendance = invitation.invited_user.attendances.build(attended_event: invitation.event )
      if attendance.save
        invitation.destroy
        flash[:notice] = "Invitation accepted"
      end
    else
      flash[:error] = "Invitation not found"
    end
    redirect_back fallback_location: root_url
  end
end
