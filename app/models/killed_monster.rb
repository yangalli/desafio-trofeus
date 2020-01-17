# frozen_string_literal: true

class KilledMonster < ApplicationRecord
  # associations
  belongs_to :user, counter_cache: true
  belongs_to :monster

  # class variables
  @@monsters_type = %w(killed_monsters killed_turtles killed_bowsers)

  after_create :receive_monster_trophy

  # methods
  private

  def receive_monster_trophy
    @@monsters_type.each do |monster_type|
      send_trophy(monster_type).find_each do |trophy|
        define_monster_trophy?(trophy, monster_type) ? TrophyUser.create!(user: user, trophy: trophy) : next
      end
    end
  end

  def send_trophy(trophy_category)
    Trophy.send(trophy_category)
  end

  def define_monster_trophy?(trophy, trophy_category)
    !user.trophies.include?(trophy) && user.send("all_#{trophy_category}") >= trophy.value
  end
end
