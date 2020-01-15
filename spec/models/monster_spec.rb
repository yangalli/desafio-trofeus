require 'rails_helper'

RSpec.describe Monster, type: :model do
  it 'is valid with name' do
    monster = create(:monster)
    expect(monster).to be_valid
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  context 'Associations' do
    it { is_expected.to have_many(:users) }
    it { is_expected.to have_many(:killed_monsters) }
  end
end
