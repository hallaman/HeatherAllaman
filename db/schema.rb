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

ActiveRecord::Schema.define(version: 20170201211323) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "comment_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "comment_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "comment_anc_desc_udx", unique: true
  add_index "comment_hierarchies", ["descendant_id"], name: "comment_desc_idx"

  create_table "comments", force: :cascade do |t|
    t.string   "author"
    t.string   "link"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "parent_id"
    t.integer  "post_id"
    t.integer  "likes"
  end

  create_table "faqs", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fridays", force: :cascade do |t|
    t.integer  "issue_id"
    t.string   "date"
    t.text     "entry"
    t.text     "affirmation"
    t.string   "moon_sign"
    t.string   "theme"
    t.integer  "number_1"
    t.integer  "number_2"
    t.integer  "number_3"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "mantra_file_name"
    t.string   "mantra_content_type"
    t.integer  "mantra_file_size"
    t.datetime "mantra_updated_at"
  end

  create_table "issues", force: :cascade do |t|
    t.string   "issue_number"
    t.string   "week"
    t.binary   "main_image"
    t.string   "moon_phase"
    t.text     "welcome"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "main_image_file_name"
    t.string   "main_image_content_type"
    t.integer  "main_image_file_size"
    t.datetime "main_image_updated_at"
    t.binary   "symbol"
    t.string   "symbol_file_name"
    t.string   "symbol_content_type"
    t.integer  "symbol_file_size"
    t.datetime "symbol_updated_at"
  end

  create_table "latest_items", force: :cascade do |t|
    t.string   "title"
    t.string   "link"
    t.boolean  "show"
    t.binary   "image"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "button_text"
  end

  create_table "media", force: :cascade do |t|
    t.string   "link"
    t.string   "title"
    t.binary   "file"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "members", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "members", ["email"], name: "index_members_on_email", unique: true
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true

  create_table "mondays", force: :cascade do |t|
    t.integer  "issue_id"
    t.string   "date"
    t.text     "entry"
    t.text     "affirmation"
    t.string   "moon_sign"
    t.string   "theme"
    t.integer  "number_1"
    t.integer  "number_2"
    t.integer  "number_3"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "mantra_file_name"
    t.string   "mantra_content_type"
    t.integer  "mantra_file_size"
    t.datetime "mantra_updated_at"
  end

  create_table "newsbars", force: :cascade do |t|
    t.text     "message"
    t.boolean  "show"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "numbers", force: :cascade do |t|
    t.integer  "number"
    t.text     "meaning"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pages", force: :cascade do |t|
    t.text     "body"
    t.binary   "main_image"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "main_image_file_name"
    t.string   "main_image_content_type"
    t.integer  "main_image_file_size"
    t.datetime "main_image_updated_at"
    t.string   "name"
  end

  create_table "podcast_details", force: :cascade do |t|
    t.string   "title"
    t.binary   "image"
    t.string   "link"
    t.integer  "podcast_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "entry"
  end

  create_table "podcasts", force: :cascade do |t|
    t.string   "title"
    t.binary   "main_image"
    t.text     "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "main_image_file_name"
    t.string   "main_image_content_type"
    t.integer  "main_image_file_size"
    t.datetime "main_image_updated_at"
    t.string   "date"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.binary   "main_image"
    t.string   "category"
    t.datetime "publish_date"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "main_image_file_name"
    t.string   "main_image_content_type"
    t.integer  "main_image_file_size"
    t.datetime "main_image_updated_at"
    t.string   "short_title"
    t.integer  "likes"
  end

  create_table "saturdays", force: :cascade do |t|
    t.integer  "issue_id"
    t.string   "date"
    t.text     "entry"
    t.text     "affirmation"
    t.string   "moon_sign"
    t.string   "theme"
    t.integer  "number_1"
    t.integer  "number_2"
    t.integer  "number_3"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "mantra_file_name"
    t.string   "mantra_content_type"
    t.integer  "mantra_file_size"
    t.datetime "mantra_updated_at"
  end

  create_table "sidebars", force: :cascade do |t|
    t.string   "link"
    t.string   "title"
    t.binary   "image"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "issue_id"
    t.integer  "podcast_link_id"
  end

  create_table "sundays", force: :cascade do |t|
    t.integer  "issue_id"
    t.string   "date"
    t.text     "entry"
    t.text     "affirmation"
    t.string   "moon_sign"
    t.string   "theme"
    t.integer  "number_1"
    t.integer  "number_2"
    t.integer  "number_3"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "mantra_file_name"
    t.string   "mantra_content_type"
    t.integer  "mantra_file_size"
    t.datetime "mantra_updated_at"
  end

  create_table "testimonials", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.binary   "image"
    t.boolean  "show"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "thursdays", force: :cascade do |t|
    t.integer  "issue_id"
    t.string   "date"
    t.text     "entry"
    t.text     "affirmation"
    t.string   "moon_sign"
    t.string   "theme"
    t.integer  "number_1"
    t.integer  "number_2"
    t.integer  "number_3"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "mantra_file_name"
    t.string   "mantra_content_type"
    t.integer  "mantra_file_size"
    t.datetime "mantra_updated_at"
  end

  create_table "tuesdays", force: :cascade do |t|
    t.integer  "issue_id"
    t.string   "date"
    t.text     "entry"
    t.text     "affirmation"
    t.string   "moon_sign"
    t.string   "theme"
    t.integer  "number_1"
    t.integer  "number_2"
    t.integer  "number_3"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "mantra_file_name"
    t.string   "mantra_content_type"
    t.integer  "mantra_file_size"
    t.datetime "mantra_updated_at"
  end

  create_table "videos", force: :cascade do |t|
    t.string   "embed_code"
    t.boolean  "show"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"

  create_table "wednesdays", force: :cascade do |t|
    t.integer  "issue_id"
    t.string   "date"
    t.text     "entry"
    t.text     "affirmation"
    t.string   "moon_sign"
    t.string   "theme"
    t.integer  "number_1"
    t.integer  "number_2"
    t.integer  "number_3"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "mantra_file_name"
    t.string   "mantra_content_type"
    t.integer  "mantra_file_size"
    t.datetime "mantra_updated_at"
  end

end
