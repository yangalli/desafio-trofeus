class KilledMonster < ApplicationRecord
  belongs_to :user
  belongs_to :monster

  def user_receive_trophy
    Trophy.send('killed_monsters').find_each do |trophy|
      TrophyUser.create!(user: user, trophy: trophy)
    end
  end
end
