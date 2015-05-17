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

ActiveRecord::Schema.define(version: 20141001184148) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blog_memberships", force: :cascade do |t|
    t.integer  "blog_id",    null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blog_memberships", ["blog_id", "user_id"], name: "index_blog_memberships_on_blog_id_and_user_id", unique: true, using: :btree
  add_index "blog_memberships", ["blog_id"], name: "index_blog_memberships_on_blog_id", using: :btree
  add_index "blog_memberships", ["user_id"], name: "index_blog_memberships_on_user_id", using: :btree

  create_table "blogs", force: :cascade do |t|
    t.integer  "owner_id",   null: false
    t.string   "title",      null: false
    t.string   "url",        null: false
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blogs", ["owner_id"], name: "index_blogs_on_owner_id", using: :btree
  add_index "blogs", ["slug"], name: "index_blogs_on_slug", unique: true, using: :btree
  add_index "blogs", ["title"], name: "index_blogs_on_title", using: :btree
  add_index "blogs", ["url"], name: "index_blogs_on_url", unique: true, using: :btree

  create_table "followings", force: :cascade do |t|
    t.integer  "blog_id",     null: false
    t.integer  "follower_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "followings", ["blog_id", "follower_id"], name: "index_followings_on_blog_id_and_follower_id", unique: true, using: :btree
  add_index "followings", ["blog_id"], name: "index_followings_on_blog_id", using: :btree
  add_index "followings", ["follower_id"], name: "index_followings_on_follower_id", using: :btree

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "post_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "likes", ["post_id"], name: "index_likes_on_post_id", using: :btree
  add_index "likes", ["user_id", "post_id"], name: "index_likes_on_user_id_and_post_id", unique: true, using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.integer  "author_id",  null: false
    t.integer  "blog_id",    null: false
    t.string   "title",      null: false
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["author_id"], name: "index_posts_on_author_id", using: :btree
  add_index "posts", ["blog_id"], name: "index_posts_on_blog_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "post_id",    null: false
    t.integer  "tag_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taggings", ["post_id", "tag_id"], name: "index_taggings_on_post_id_and_tag_id", unique: true, using: :btree
  add_index "taggings", ["post_id"], name: "index_taggings_on_post_id", using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "label",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["label"], name: "index_tags_on_label", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                                                                               null: false
    t.string   "password_digest",                                                                     null: false
    t.string   "session_token",                                                                       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",                                                                            null: false
    t.string   "avatar_url",      default: "https://www.filepicker.io/api/file/3JsiRaA0QcW2T7vGGRcI", null: false
    t.string   "slug"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
