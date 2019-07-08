FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    # username { Faker::Internet.username(5..8) }
    password { Faker::Internet.password }
    password_digest { password }

    sequence(:username) { |n| "#{Faker::Internet.username(5..8)}-#{n}" }
  end

  factory :post do
    title {Faker::Lorem.word}
    content {Faker::Lorem.sentence}
  end

  factory :comment do
    user
    post
    content { Faker::Lorem.sentence }
  end

  factory :like do
    user
    post
    tol { rand 1..10 }
  end
end
#
# FactoryBot.define do
#
# end
#
# FactoryBot.define do
#
# end
