class Trophy < ApplicationRecord
  enum trophy_category: %i[collected_coins killed_monsters times_of_death]

  has_many :trophy_users, dependent: :destroy
  has_many :users, through: :trophy_users
end
