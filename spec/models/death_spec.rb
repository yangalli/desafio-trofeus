require 'rails_helper'

RSpec.describe Death, type: :model do
  it 'is valid with user' do
    collected_coin = create(:collected_coin)
    expect(collected_coin).to be_valid
  end

  context 'Associations' do
    it { is_expected.to belong_to(:user) }
  end
end
