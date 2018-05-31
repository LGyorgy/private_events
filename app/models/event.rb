class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  has_many :attendances, foreign_key: 'attended_event_id'
  has_many :attendees, through: :attendances

  default_scope { order(date: :desc) }

  scope :past,     -> { where('date < ?', Time.now) }
  scope :future,   -> { where('date > ?', Time.now) }
end
