class TrophyUser < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :trophy
end
