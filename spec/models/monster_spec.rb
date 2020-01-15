require 'rails_helper'

RSpec.describe Monster, type: :model do
  it 'is valid with name' do
    monster = create(:monster)
    expect(monster).to be_valid
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).ignoring_case_sensitivity }
    it { is_expected.to validate_length_of(:name).is_at_least(2).is_at_most(25) }
  end

  context 'Associations' do
    it { is_expected.to have_many(:killed_monsters) }
    it { is_expected.to have_many(:users).through(:killed_monsters) }
  end
end
