class Death < ApplicationRecord
  belongs_to :user

  after_create :user_receive_trophy

  def user_receive_trophy
    Trophy.send('times_of_death').find_each do |trophy|
      TrophyUser.create!(user: user, trophy: trophy)
    end
  end
end
