# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170405031742) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "follows", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "followee_id"
  end

  create_table "invitations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "invite_token"
    t.string   "name"
    t.string   "message"
    t.string   "from"
  end

  create_table "queue_items", force: true do |t|
    t.integer  "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "video_id"
  end

  create_table "reviews", force: true do |t|
    t.text     "comment"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "video_id"
    t.integer  "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "full_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reset_token"
  end

  create_table "videos", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "small_cover_url"
    t.string   "large_cover_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
  end

end
