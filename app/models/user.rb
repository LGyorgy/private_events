class User < ApplicationRecord
  validates :name,  presence: true
  validates :email, presence: true, uniqueness: true

  has_many :events, foreign_key: 'creator_id',
                    dependent:   :destroy

  has_many :attendances, foreign_key: 'attendee_id'
  has_many :attended_events, through: :attendances

  def upcoming_events
    self.events.future
  end

  def previous_events
    self.events.past
  end
end
