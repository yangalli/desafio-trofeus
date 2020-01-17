# frozen_string_literal: true

class Trophy < ApplicationRecord
  # trophy categories
  enum trophy_category: { collected_coins: 0, killed_monsters: 1,
    times_of_death: 2, killed_turtles: 3, killed_bowsers: 4 }

  # associations
  has_many :trophy_users, dependent: :destroy
  has_many :users, through: :trophy_users

  # validations
  validates_associated :trophy_users, :users
  validates :value, presence: true, numericality: { only_integer: true,
    less_than_or_equal_to: 100_000 }
  validates :trophy_category, presence: true,
    inclusion: { in: trophy_categories.keys }
end
