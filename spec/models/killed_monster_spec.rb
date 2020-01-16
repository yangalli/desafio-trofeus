require 'rails_helper'

RSpec.describe KilledMonster, type: :model do
  it 'is valid with user and monster' do
    killed_monster = create(:killed_monster)
    expect(killed_monster).to be_valid
  end

  context 'Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:monster) }
  end

  context 'Methods' do
    describe '#user_receive_trophy' do
      let(:user) { create(:user) }
      
      before(:each) do
        load "#{Rails.root}/db/seeds.rb" 
      end

      context 'when user reaches a killed_monster trophy value' do
        it 'rewards a user with a killed_monster trophy' do
          monster_trophy = Trophy.where(trophy_category: "killed_monsters").find_by(value: 1)
          create(:killed_monster, user: user)
          user.reload
          expect(user.trophies).to include(monster_trophy)
        end

        it 'rewards the user only with the correct killed_monster trophy' do
          monster_trophy1 = Trophy.where(trophy_category: "killed_monsters").find_by(value: 1)
          monster_trophy2 = Trophy.where(trophy_category: "killed_monsters").find_by(value: 100)
          create_list(:killed_monster, 2, user: user)          
          user.reload
          expect(user.trophies).not_to include(monster_trophy2)
        end
      end
    end
  end
end
