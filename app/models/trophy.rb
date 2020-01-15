class Trophy < ApplicationRecord
  # Trophy Categories
  enum trophy_category: { collected_coins: 0, killed_monsters: 1, times_of_death: 2 }

  # Associations
  has_many :trophy_users, dependent: :destroy
  has_many :users, through: :trophy_users

  # Validations
  validates_associated :trophy_users, :users
  validates :value, presence: true, numericality: { only_integer: true, 
    less_than_or_equal_to: 100000 }
  validates :trophy_category, presence: true, inclusion: { in: trophy_categories.keys }
end
