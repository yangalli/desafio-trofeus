class Death < ApplicationRecord
  # Associations
  belongs_to :user

  after_create :user_receive_trophy
  
  # Methods
  private

  def user_receive_trophy
    Trophy.send('times_of_death').find_each do |trophy|
      define_trophy?(trophy) ? TrophyUser.create!(user: user, trophy: trophy) : next
    end
  end

  def define_trophy?(trophy)
    'times_of_death' ? !user.trophies.include?(trophy) && user.all_times_of_deaths >= trophy.value : false
  end
end
