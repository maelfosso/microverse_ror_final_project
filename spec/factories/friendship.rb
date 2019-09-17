# frozen_string_literal: true

FactoryBot.define do
  factory :friendship do
    date { Date.today }
    status { 0 }
    acceptor
    requestor
  end
end
