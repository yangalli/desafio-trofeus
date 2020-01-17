# frozen_string_literal: true

FactoryBot.define do
  factory :collected_coin do
    value { 10 }
    user
  end
end
