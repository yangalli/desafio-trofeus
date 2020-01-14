class CollectedCoin < ApplicationRecord
  belongs_to :user

  after_create :user_receive_trophy

  private
  
  def user_receive_trophy
    Trophy.send('collected_coins').find_each do |trophy|
      TrophyUser.create!(user: user, trophy: trophy)
    end
  end
end
