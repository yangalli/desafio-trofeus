require 'rails_helper'

RSpec.describe Death, type: :model do
  it 'is valid with user' do
    death = create(:death)
    expect(death).to be_valid
  end

  context 'Associations' do
    it { is_expected.to belong_to(:user) }
  end
end
