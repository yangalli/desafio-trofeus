require 'rails_helper'

RSpec.describe Trophy, type: :model do
  it 'is valid with value and trophy_category' do
    trophy = build(:trophy)
    expect(trophy).to be_valid
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of(:value) }
    it { is_expected.to validate_numericality_of(:value).only_integer }
    it { is_expected.to validate_numericality_of(:value).is_less_than_or_equal_to(100000) }
    it { is_expected.to validate_presence_of(:trophy_category) }
  end

  context 'Associations' do
    it { is_expected.to have_many(:trophy_users) }
    it { is_expected.to have_many(:users).through(:trophy_users) }
  end

  context 'Methods' do
    describe '#create' do
      context 'when creating' do
        it 'creates collected_coins trophy' do
          coin_trophy = create(:coin_trophy)
          expect(Trophy.all).to include(coin_trophy)
        end
        
        it 'creates killed_monsters trophy' do
          monster_trophy = create(:monster_trophy)
          expect(Trophy.all).to include(monster_trophy)
        end
  
        it 'creates times_of_death trophy' do
          death_trophy = create(:death_trophy)
          expect(Trophy.all).to include(death_trophy)
        end
      end
    end
  end
end
