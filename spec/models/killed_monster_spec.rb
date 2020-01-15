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
end
