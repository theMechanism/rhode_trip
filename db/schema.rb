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

ActiveRecord::Schema.define(version: 20150930170646) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "categories", ["category_id"], name: "index_categories_on_category_id", using: :btree

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.text     "abstract"
    t.text     "description"
    t.string   "occupation"
    t.boolean  "allow_comments"
    t.boolean  "approved"
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "people", ["author_type", "author_id"], name: "index_people_on_author_type_and_author_id", using: :btree

  create_table "people_places", id: false, force: :cascade do |t|
    t.integer "place_id"
    t.integer "person_id"
  end

  create_table "places", force: :cascade do |t|
    t.text     "address"
    t.decimal  "lat"
    t.decimal  "long"
    t.string   "name"
    t.integer  "category_id"
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "places", ["author_type", "author_id"], name: "index_places_on_author_type_and_author_id", using: :btree
  add_index "places", ["category_id"], name: "index_places_on_category_id", using: :btree

  add_foreign_key "categories", "categories"
  add_foreign_key "places", "categories"
end
