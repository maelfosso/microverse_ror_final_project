# frozen_string_literal: true

FactoryBot.define do
  factory :like do
    user
    kind { rand 0..5 }
    after(:build) do |like|
      like.subject = create(:post)
    end
  end
end
