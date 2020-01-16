require 'rails_helper'

RSpec.describe Death, type: :model do
  it 'is valid with user' do
    death = create(:death)
    expect(death).to be_valid
  end

  context 'Associations' do
    it { is_expected.to belong_to(:user) }
  end

  context 'Methods' do
    describe '#user_receive_trophy' do
      let(:user) { create(:user) }
    
      before(:each) do
        load "#{Rails.root}/db/seeds.rb" 
      end

      context 'when user reaches a times_of_death trophy value' do
        it 'rewards the user with a times_of_death trophy' do
          death_trophy = Trophy.where(trophy_category: "times_of_death").find_by(value: 1)
          create(:death, user: user)
          user.reload
          expect(user.trophies).to include(death_trophy)
        end
        
        it 'rewards the user only with the correct times_of_death trophy' do
          death_trophy1 = Trophy.where(trophy_category: "times_of_death").find_by(value: 1)
          death_trophy2 = Trophy.where(trophy_category: "times_of_death").find_by(value: 10)
          create_list(:death, 3, user: user)
          user.reload
          expect(user.trophies).not_to include(death_trophy2)
        end
      end
    end
  end
end
