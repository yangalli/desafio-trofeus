require 'rails_helper'

RSpec.describe CollectedCoin, type: :model do
  it 'is valid with value and user' do
    collected_coin = create(:collected_coin)
    expect(collected_coin).to be_valid
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of(:value) }
    it { is_expected.to validate_numericality_of(:value).only_integer }
    it { is_expected.to validate_numericality_of(:value).is_less_than_or_equal_to(100000) }
  end

  context 'Associations' do
    it { is_expected.to belong_to(:user) }
  end

  context 'Methods' do
    
  end
end
