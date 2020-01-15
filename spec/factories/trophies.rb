FactoryBot.define do
  factory :trophy do
    value { 1 }
    sequence(:trophy_category) { Trophy.trophy_categories.keys.sample }
  end
end
