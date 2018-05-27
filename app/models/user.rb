class User < ApplicationRecord
  validates :name,  presence: true
  validates :email, presence: true, uniqueness: true

  has_many :events, foreign_key: 'creator_id',
                    dependent:   :destroy
end
