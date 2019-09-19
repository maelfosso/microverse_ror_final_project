# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    user
    content { Faker::Lorem.sentence }
    after(:build) do |comment|
      comment.subject = create(:post)
    end
  end
end
