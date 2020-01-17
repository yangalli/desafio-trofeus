# frozen_string_literal: true

FactoryBot.define do
  factory :trophy do
    value { 10 }
    trophy_category { Trophy.trophy_categories.keys.sample }

    trait :coin do
      trophy_category { "collected_coins" }
    end

    trait :monster do
      trophy_category { "killed_monsters" }
    end

    trait :death do
      trophy_category { "times_of_death" }
    end

    factory :coin_trophy, traits: [:coin]
    factory :monster_trophy, traits: [:monster]
    factory :death_trophy, traits: [:death]
  end
end
