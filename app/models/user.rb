class User < ApplicationRecord
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
end
