class User < ApplicationRecord
  # Devise
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_many :deaths, dependent: :destroy
  has_many :collected_coins, dependent: :destroy
  has_many :killed_monsters, dependent: :destroy
  has_many :trophy_users, dependent: :destroy
  
  has_many :monsters, through: :killed_monsters
  has_many :trophies, through: :trophy_users

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
