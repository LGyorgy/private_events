class User < ApplicationRecord
  validates :name,  presence: true
  validates :email, presence: true, uniqueness: true

  has_many :events, foreign_key: 'creator_id',
                    dependent:   :destroy

  has_many :attendances, foreign_key: 'attendee_id'
  has_many :attended_events, through: :attendances

  has_many :sent_invitations,     foreign_key: 'inviter_id',       class_name: 'Invitation'
  has_many :received_invitations, foreign_key: 'invited_user_id', class_name: 'Invitation'
  has_many :invited_events, through: :received_invitations, source: :event

  def upcoming_events
    self.events.future
  end

  def previous_events
    self.events.past
  end
end
