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
end
