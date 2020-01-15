FactoryBot.define do
  factory :trophy do
    value { 10 }
    trophy_category { Trophy.trophy_categories.keys.sample }
  end
end
