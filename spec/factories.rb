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
    post
    content { Faker::Lorem.sentence }
  end

  factory :like do
    user
    variety { rand 1..9 }
    subject_type { 'post' }
    subject_id { rand 1..1000 }
  end

  factory :notification do
    user
    content { Faker::Lorem.sentence }
  end
end
