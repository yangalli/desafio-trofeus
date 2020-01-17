# frozen_string_literal: true

class Monster < ApplicationRecord
  # associations
  has_many :killed_monsters, dependent: :destroy
  has_many :users, through: :killed_monsters

  # validations
  validates_associated :killed_monsters, :users
  validates :name, presence: true,
    uniqueness: { case_sensitive: false }, length: { in: 2..25 }
end
