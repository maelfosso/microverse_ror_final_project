# frozen_string_literal: true

FactoryBot.define do
  factory :user, aliases: %i[acceptor requestor] do
    name { Faker::Name.name }
    password { Faker::Internet.password }
    username { name.delete(' ').downcase }
    email { "#{username}@microverse.com" }
    photo_path { "avatars/#{rand 1..4}.png" }
  end
end
