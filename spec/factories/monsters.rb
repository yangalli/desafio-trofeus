# frozen_string_literal: true

FactoryBot.define do
  factory :monster do
    name { Faker::Name.name }
  end
end
