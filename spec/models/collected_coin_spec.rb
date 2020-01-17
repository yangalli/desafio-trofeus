# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CollectedCoin, type: :model do
  it 'is valid with value and user' do
    collected_coin = build(:collected_coin)
    expect(collected_coin).to be_valid
  end

  context 'when validating' do
    it { is_expected.to validate_presence_of(:value) }
    it { is_expected.to validate_numericality_of(:value).only_integer }
    it { is_expected.to validate_numericality_of(:value).is_less_than_or_equal_to(100_000) }
  end

  context 'when associating' do
    it { is_expected.to belong_to(:user) }
  end

  context 'when calling methods' do
    describe '#user_receive_trophy' do
      let(:user) { create(:user) }

      before { load "#{Rails.root}/db/seeds.rb" }

      context 'when user reaches a collected_coin trophy value' do
        it 'rewards the user with a collected_coin trophy' do
          coin_trophy = Trophy.where(trophy_category: "collected_coins").find_by(value: 1)
          create(:collected_coin, value: 100, user: user)
          user.reload
          expect(user.trophies).to include(coin_trophy)
        end

        it 'rewards the user with the correct collected_coin trophy' do
          coin_trophy2 = Trophy.where(trophy_category: "collected_coins").find_by(value: 100)
          create(:collected_coin, value: 99, user: user)
          user.reload
          expect(user.trophies).not_to include(coin_trophy2)
        end
      end
    end
  end
end
