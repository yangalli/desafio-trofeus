# frozen_string_literal: true

class Death < ApplicationRecord
  # associations
  belongs_to :user, counter_cache: true

  after_create :user_receive_trophy
  
  # methods
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
