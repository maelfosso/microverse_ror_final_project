# frozen_string_literal: true

FactoryBot.define do
  factory :user, aliases: %i[to_user from_user] do
    name { Faker::Name.name }
    password { Faker::Internet.password }
    sequence(:username) { |n| "#{Faker::Internet.username(5..8)}-#{n}" }
    email { "#{username.downcase}@microverse.com" }
  end

  factory :friendship do
    date { Date.today }
    status { 0 }
    to_user
    from_user
  end

  factory :post do
    user
    title { Faker::Lorem.word }
    content { Faker::Lorem.sentence }
  end

  factory :comment do
    user
    content { Faker::Lorem.sentence }
    after(:build) do |comment|
      comment.subject = create(:post)
    end
  end

  factory :like do
    user
    kind { rand 1..9 }
    after(:build) do |like|
      like.subject = create(:post)
    end
  end

  factory :notification do
    user
    content { Faker::Lorem.sentence }
  end
end
