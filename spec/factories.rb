# frozen_string_literal: true

FactoryBot.define do
  factory :user, aliases: %i[acceptor requestor] do
    name { Faker::Name.name }
    password { Faker::Internet.password }
    username { name.delete(' ').downcase }
    email { "#{username}@microverse.com" }
  end

  factory :friendship do
    date { Date.today }
    status { 0 }
    acceptor
    requestor
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
    kind { rand 0..5 }
    after(:build) do |like|
      like.subject = create(:post)
    end
  end

  factory :notification do
    user
    content { Faker::Lorem.sentence }
  end
end
