# frozen_string_literal: true

FactoryBot.define do
  factory :todo do
    name { Faker::Lorem.sentence }
    list
  end
end
