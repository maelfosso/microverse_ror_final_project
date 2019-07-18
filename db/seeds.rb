# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

FactoryBot.create_list(:post, 5, user: User.find(1))
5.times do
  user = FactoryBot.create(:user)
  FactoryBot.create_list(:post, 5, user: user)
end