# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

u1 = FactoryBot.create(:user, email: 'u1@microverse.com', password: 'student1')
FactoryBot.create_list(:post, 1, user: u1)

u2 = FactoryBot.create(:user, email: 'u2@microverse.com', password: 'student2')
FactoryBot.create_list(:post, 1, user: u2)

u3 = FactoryBot.create(:user, email: 'u3@microverse.com', password: 'student3')
FactoryBot.create_list(:post, 1, user: u3)

u4 = FactoryBot.create(:user, email: 'u4@microverse.com', password: 'student4')
FactoryBot.create_list(:post, 1, user: u4)

u5 = FactoryBot.create(:user, email: 'u5@microverse.com', password: 'student5')
FactoryBot.create_list(:post, 1, user: u5)

FactoryBot.create(:friendship, requestor: u1, acceptor: u2, status: 1)
FactoryBot.create(:friendship, requestor: u1, acceptor: u3, status: 1)
FactoryBot.create(:friendship, requestor: u2, acceptor: u3, status: 1)
FactoryBot.create(:friendship, requestor: u2, acceptor: u4, status: 1)
FactoryBot.create(:friendship, requestor: u3, acceptor: u5, status: 1)
FactoryBot.create(:friendship, requestor: u4, acceptor: u5, status: 1)

u1.posts[0].likes = [FactoryBot.create(:like, user: u2), FactoryBot.create(:like, user: u3)]
u2.posts[0].likes = [FactoryBot.create(:like, user: u3), FactoryBot.create(:like, user: u4)]
u3.posts[0].likes = [FactoryBot.create(:like, user: u1), FactoryBot.create(:like, user: u2)]
u4.posts[0].likes = [FactoryBot.create(:like, user: u2), FactoryBot.create(:like, user: u5)]
u5.posts[0].likes = [FactoryBot.create(:like, user: u3), FactoryBot.create(:like, user: u4)]
