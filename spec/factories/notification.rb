# frozen_string_literal: true

FactoryBot.define do
  factory :notification do
    content { Faker::Lorem.sentence }
  end
end
