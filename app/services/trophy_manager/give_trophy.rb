module TrophyManager
  class GiveTrophy < ApplicationService
    attr_reader :user, :trophy_type
  
    def initialize(user, trophy_type)
      @user = user
      @trophy_type = trophy_type
    end
  
    def send_trophy
      Trophy.send(trophy_type).find_each do |trophy|
        TrophyUser.create!(user: user, trophy: trophy)
      end
    end
  end
end
