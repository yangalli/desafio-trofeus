# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Death, type: :model do
  it 'is valid with user' do
    death = create(:death)
    expect(death).to be_valid
  end

  context 'when associating' do
    it { is_expected.to belong_to(:user) }
  end

  context 'when calling methods' do
    describe '#user_receive_trophy' do
      let(:user) { create(:user) }

      before { load "#{Rails.root}/db/seeds.rb" }

      context 'when user reaches a times_of_death trophy value' do
        it 'rewards the user with a times_of_death trophy' do
          death_trophy = Trophy.where(trophy_category: "times_of_death").find_by(value: 1)
          create(:death, user: user)
          user.reload
          expect(user.trophies).to include(death_trophy)
        end

        it 'rewards the user only with the correct times_of_death trophy' do
          death_trophy2 = Trophy.where(trophy_category: "times_of_death").find_by(value: 5)
          create_list(:death, 4, user: user)
          user.reload
          expect(user.trophies).not_to include(death_trophy2)
        end
      end
    end
  end
end
