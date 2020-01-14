class Monster < ApplicationRecord
  has_many :killed_monsters, dependent: :destroy
  has_many :users, through: :killed_monsters
end
