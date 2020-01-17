# frozen_string_literal: true

class User < ApplicationRecord
  # devise
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  # associations
  has_many :deaths, dependent: :destroy
  has_many :collected_coins, dependent: :destroy
  has_many :killed_monsters, dependent: :destroy
  has_many :trophy_users, dependent: :destroy

  has_many :monsters, through: :killed_monsters
  has_many :trophies, through: :trophy_users

  # validations
  validates_associated :deaths, :collected_coins, :killed_monsters,
    :trophy_users, :monsters, :trophies

  # methods
  def all_collected_coins
    collected_coins.sum(:value)
  end

  def all_killed_monsters
    monsters.count
  end

  def all_killed_turtles
    monsters.where(name: 'turtle').count
  end

  def all_killed_bowsers
    monsters.where(name: 'bowser').count
  end

  def all_times_of_deaths
    deaths.count
  end
end
