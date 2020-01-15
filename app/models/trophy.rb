class Trophy < ApplicationRecord
  # Trophy Categories
  enum trophy_category: %i[collected_coins killed_monsters times_of_death]

  # Associations
  has_many :trophy_users, dependent: :destroy
  has_many :users, through: :trophy_users

  # Validations
  validates_associated :trophy_users, :users
  validates :value, presence: true, numericality: { only_integer: true, 
    less_than_or_equal_to: 100000 }
end
