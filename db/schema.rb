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

ActiveRecord::Schema.define(version: 20151013180728) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.boolean  "is_parent"
    t.integer  "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "categories", ["parent_id"], name: "index_categories_on_parent_id", using: :btree

  create_table "categories_places", id: false, force: :cascade do |t|
    t.integer "place_id",    null: false
    t.integer "category_id", null: false
  end

  add_index "categories_places", ["category_id", "place_id"], name: "index_categories_places_on_category_id_and_place_id", using: :btree
  add_index "categories_places", ["place_id", "category_id"], name: "index_categories_places_on_place_id_and_category_id", using: :btree

  create_table "embeds", force: :cascade do |t|
    t.integer  "uploadable_id"
    t.string   "uploadable_type"
    t.integer  "upload_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "embeds", ["upload_id"], name: "index_embeds_on_upload_id", using: :btree
  add_index "embeds", ["uploadable_type", "uploadable_id"], name: "index_embeds_on_uploadable_type_and_uploadable_id", using: :btree

  create_table "people", force: :cascade do |t|
    t.datetime "publish_date"
    t.string   "name"
    t.text     "abstract"
    t.text     "description"
    t.string   "occupation"
    t.boolean  "allow_comments"
    t.boolean  "approved"
    t.integer  "author_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "people", ["author_id"], name: "index_people_on_author_id", using: :btree

  create_table "people_places", id: false, force: :cascade do |t|
    t.integer "place_id"
    t.integer "person_id"
  end

  create_table "places", force: :cascade do |t|
    t.datetime "publish_date"
    t.string   "line_1"
    t.string   "line_2"
    t.string   "city"
    t.string   "zip"
    t.decimal  "lat"
    t.decimal  "long"
    t.string   "name"
    t.boolean  "approved"
    t.integer  "author_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "places", ["author_id"], name: "index_places_on_author_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "uploads", force: :cascade do |t|
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "attached_file_name"
    t.string   "attached_content_type"
    t.integer  "attached_file_size"
    t.datetime "attached_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "display_name"
    t.string   "role"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
