# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    user
    title { Faker::Lorem.word }
    content { Faker::Lorem.sentence }
  end
end
