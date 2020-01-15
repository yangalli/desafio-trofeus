class CollectedCoin < ApplicationRecord
  # Associations
  belongs_to :user

  # Validations
  validates :value, presence: true, numericality: { only_integer: true, 
    less_than_or_equal_to: 100000 }

  after_create :user_receive_trophy

  # Methods
  private
  
  def user_receive_trophy
    Trophy.send('collected_coins').find_each do |trophy|
      define_trophy?(trophy) ? TrophyUser.create!(user: user, trophy: trophy) : next
    end
  end

  def define_trophy?(trophy)
    'collected_coins' ? !user.trophies.include?(trophy) && user.all_collected_coins >= trophy.value : false
  end
end
