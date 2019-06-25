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

ActiveRecord::Schema.define(version: 2019_06_24_114140) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendships", force: :cascade do |t|
    t.date "date"
    t.integer "status", limit: 2, null: false
    t.bigint "to_user_id"
    t.bigint "from_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["from_user_id"], name: "index_friendships_on_from_user_id"
    t.index ["to_user_id"], name: "index_friendships_on_to_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.binary "photo"
    t.string "gender"
    t.date "date_of_birth"
    t.string "nationality"
    t.string "username", null: false
    t.string "password", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "friendships", "users", column: "from_user_id"
  add_foreign_key "friendships", "users", column: "to_user_id"
end
