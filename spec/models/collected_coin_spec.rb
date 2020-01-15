require 'rails_helper'

RSpec.describe CollectedCoin, type: :model do
  it 'is valid with value and user' do
    collected_coin = create(:collected_coin)
    expect(collected_coin).to be_valid
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of(:value) }
  end

  context 'Associations' do
    it { is_expected.to belong_to(:user) }
  end

  context 'Instance Methods' do
    
  end
end
