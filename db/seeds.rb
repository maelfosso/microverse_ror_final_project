# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

u1 = FactoryBot.create(:user, email: 'u1@microverse.com', password: 'student1')
p1 = FactoryBot.create(:post, user: u1)

u2 = FactoryBot.create(:user, email: 'u2@microverse.com', password: 'student2')
p2 = FactoryBot.create(:post, user: u2)

u3 = FactoryBot.create(:user, email: 'u3@microverse.com', password: 'student3')
p3 = FactoryBot.create(:post, user: u3)

u4 = FactoryBot.create(:user, email: 'u4@microverse.com', password: 'student4')
p4 = FactoryBot.create(:post, user: u4)

u5 = FactoryBot.create(:user, email: 'u5@microverse.com', password: 'student5')
p5 = FactoryBot.create(:post, user: u5)

FactoryBot.create(:friendship, requestor: u1, acceptor: u2, status: 1)
FactoryBot.create(:friendship, requestor: u1, acceptor: u3, status: 1)
FactoryBot.create(:friendship, requestor: u2, acceptor: u3, status: 1)
FactoryBot.create(:friendship, requestor: u2, acceptor: u4, status: 1)
FactoryBot.create(:friendship, requestor: u3, acceptor: u5, status: 1)
FactoryBot.create(:friendship, requestor: u4, acceptor: u5, status: 1)

p1.likes = [FactoryBot.create(:like, user: u2, post: p1), FactoryBot.create(:like, user: u3, post: p1)]
p2.likes = [FactoryBot.create(:like, user: u3, post: p2), FactoryBot.create(:like, user: u4, post: p2)]
p3.likes = [FactoryBot.create(:like, user: u1, post: p3), FactoryBot.create(:like, user: u2, post: p3)]
p4.likes = [FactoryBot.create(:like, user: u2, post: p4), FactoryBot.create(:like, user: u5, post: p4)]
p5.likes = [FactoryBot.create(:like, user: u3, post: p5), FactoryBot.create(:like, user: u4, post: p5)]
