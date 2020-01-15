require 'rails_helper'

RSpec.describe TrophyUser, type: :model do
  it 'is valid with user and trophy' do
    trophy_user = create(:trophy_user)
    expect(trophy_user).to be_valid
  end

  context 'Associations' do
    it { is_expected.to belong_to(:trophy) }
    it { is_expected.to belong_to(:user) }
  end
end
