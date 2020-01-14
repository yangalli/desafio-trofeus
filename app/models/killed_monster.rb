class KilledMonster < ApplicationRecord
  belongs_to :user
  belongs_to :monster

  after_create :user_receive_trophy

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
