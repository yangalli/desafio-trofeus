# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'teste123' }
    password_confirmation { 'teste123' }
  end
end
