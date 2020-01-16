class KilledMonster < ApplicationRecord
  # associations
  belongs_to :user, counter_cache: true
  belongs_to :monster

  after_create :user_receive_trophy

  # methods
  private

  def user_receive_trophy
    Trophy.send('killed_monsters').find_each do |trophy|
      define_trophy?(trophy) ? TrophyUser.create!(user: user, trophy: trophy) : next
    end
  end

  def define_trophy?(trophy)
    'killed_monsters' ? !user.trophies.include?(trophy) && user.all_killed_monsters >= trophy.value : false
  end
end
