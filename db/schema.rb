# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_190_708_070_140) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'comments', force: :cascade do |t|
    t.date 'date'
    t.text 'content'
    t.bigint 'post_id'
    t.bigint 'user_id'
    t.bigint 'comment_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['comment_id'], name: 'index_comments_on_comment_id'
    t.index ['post_id'], name: 'index_comments_on_post_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'friendships', force: :cascade do |t|
    t.date 'date'
    t.integer 'status', limit: 2, null: false
    t.bigint 'to_user_id'
    t.bigint 'from_user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['from_user_id'], name: 'index_friendships_on_from_user_id'
    t.index ['to_user_id'], name: 'index_friendships_on_to_user_id'
  end

  create_table 'likes', force: :cascade do |t|
    t.integer 'tol'
    t.bigint 'post_id'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['post_id'], name: 'index_likes_on_post_id'
    t.index ['user_id'], name: 'index_likes_on_user_id'
  end

  create_table 'notifications', force: :cascade do |t|
    t.text 'content'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_notifications_on_user_id'
  end

  create_table 'posts', force: :cascade do |t|
    t.string 'title'
    t.text 'content'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_posts_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.binary 'photo'
    t.string 'gender'
    t.date 'date_of_birth'
    t.string 'nationality'
    t.string 'username', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'comments', 'comments'
  add_foreign_key 'comments', 'posts'
  add_foreign_key 'comments', 'users'
  add_foreign_key 'friendships', 'users', column: 'from_user_id'
  add_foreign_key 'friendships', 'users', column: 'to_user_id'
  add_foreign_key 'likes', 'posts'
  add_foreign_key 'likes', 'users'
  add_foreign_key 'notifications', 'users'
  add_foreign_key 'posts', 'users'
end
