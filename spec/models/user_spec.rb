# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with name, password and password_confirmation' do
    user = create(:user)
    expect(user).to be_valid
  end

  context 'when associating' do
    it { is_expected.to have_many(:deaths) }
    it { is_expected.to have_many(:collected_coins) }
    it { is_expected.to have_many(:killed_monsters) }
    it { is_expected.to have_many(:trophy_users) }

    context 'with through' do
      it { is_expected.to have_many(:monsters).through(:killed_monsters) }
      it { is_expected.to have_many(:trophies).through(:trophy_users) }
    end
  end
end
