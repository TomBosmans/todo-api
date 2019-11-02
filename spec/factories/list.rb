# frozen_string_literal: true

FactoryBot.define do
  factory :list do
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
  end
end
