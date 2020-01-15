FactoryBot.define do
  factory :collected_coin do
    #sequence(:value) { |n| "#{[n, n*10, n*1000, n*10000, n*100000]}" }
    value { 10 }
    user

    trait :first_trophy do
      value { 1 }
    end

    trait :second_trophy do
      value { 100 }
    end

    trait :third_trophy do
      value { 1000 }
    end

    trait :fouth_trophy do
      value { 10000 }
    end

    trait :fifth_trophy do
      value { 100000 }
    end
  end
end
