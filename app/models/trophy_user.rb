class TrophyUser < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :trophy
end
