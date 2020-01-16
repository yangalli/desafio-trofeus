require 'rails_helper'

RSpec.describe Trophy, type: :model do
  it 'is valid with value and trophy_category' do
    trophy = create(:trophy)
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
    context '#creates' do
      it 'collected_coin trophies' do
        for n in [1, 100, 1000, 10000, 10000]
          coin_trophy[n] = create(:coin_trophy, value: n)
        end
        expect(Trophy.all).to include(coin_trophy[n]).in_array[coin_trophy[n]]
      end
  
      context 'Deaths' do
        it 'creates deaths trophies' do
          
        end
      end
  
      context 'Killed Monsters' do
        it 'creates killed monsters trophies' do
          
        end
      end
    end
  end
end
