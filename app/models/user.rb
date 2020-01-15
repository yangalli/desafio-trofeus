class User < ApplicationRecord
  # Devise
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  # Associations
  has_many :deaths, dependent: :destroy
  has_many :collected_coins, dependent: :destroy
  has_many :killed_monsters, dependent: :destroy
  has_many :trophy_users, dependent: :destroy
  
  has_many :monsters, through: :killed_monsters
  has_many :trophies, through: :trophy_users

  # Validations
  validates_associated :deaths, :collected_coins, :killed_monsters, 
    :trophy_users, :monsters, :trophies  

  # Methods
  def all_collected_coins
    collected_coins.sum(:value)
  end

  def all_killed_monsters
    monsters.count
  end

  def all_times_of_deaths
    deaths.count
  end
end
