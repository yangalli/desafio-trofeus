# frozen_string_literal: true

class KilledMonster < ApplicationRecord
  # associations
  belongs_to :user, counter_cache: true
  belongs_to :monster

  after_create :receive_monster_trophy
  after_create :receive_turtle_trophy
  after_create :receive_bowser_trophy

  # methods
  private

  def receive_monster_trophy
    send_trophy('killed_monsters').find_each do |trophy|
      define_monster_trophy?(trophy) ? TrophyUser.create!(user: user, trophy: trophy) : next
    end
  end

  def receive_turtle_trophy
    send_trophy('killed_turtles').find_each do |trophy|
      define_turtle_trophy?(trophy) ? TrophyUser.create!(user: user, trophy: trophy) : next
    end
  end

  def receive_bowser_trophy
    send_trophy('killed_bowsers').find_each do |trophy|
      define_bowser_trophy?(trophy) ? TrophyUser.create!(user: user, trophy: trophy) : next
    end
  end

  def send_trophy(trophy_category)
    Trophy.send(trophy_category)
  end

  def define_monster_trophy?(trophy)
    'killed_monsters' ? !user.trophies.include?(trophy) && user.all_killed_monsters >= trophy.value : false
  end

  def define_turtle_trophy?(trophy)
    'killed_turtles' ? !user.trophies.include?(trophy) && user.all_killed_turtles >= trophy.value : false
  end

  def define_bowser_trophy?(trophy)
    'killed_bowsers' ? !user.trophies.include?(trophy) && user.all_killed_bowsers >= trophy.value : false
  end
end
