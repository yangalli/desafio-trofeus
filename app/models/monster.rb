class Monster < ApplicationRecord
  # Associations
  has_many :killed_monsters, dependent: :destroy
  has_many :users, through: :killed_monsters

  # Validations
  validates_associated :killed_monsters, :users
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { in: 2..20 }
end
