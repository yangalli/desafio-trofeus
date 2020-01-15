require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with name, password and password_confirmation' do
    user = create(:user)
    expect(user).to be_valid
  end

  context 'Associations' do
    it { is_expected.to have_many(:collected_coins) }
    it { is_expected.to have_many(:deaths) }
  end
end
