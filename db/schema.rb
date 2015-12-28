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

ActiveRecord::Schema.define(version: 20151226134510) do

  create_table "boards", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "slug",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "boards", ["slug"], name: "index_boards_on_slug", unique: true, using: :btree

  create_table "lists", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "board_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "position",   limit: 4
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "resource_id",   limit: 4
    t.string   "resource_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "tasks", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.date     "due_date"
    t.integer  "list_id",     limit: 4
    t.integer  "board_id",    limit: 4
    t.string   "description", limit: 255
    t.string   "status",      limit: 255
    t.integer  "position",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "label",       limit: 255, default: "Bug"
    t.integer  "points",      limit: 4
  end

  create_table "user_boards", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "board_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name",    limit: 255
    t.string "last_name",     limit: 255
    t.string "email",         limit: 255
    t.string "token",         limit: 255
    t.string "password_hash", limit: 255
    t.string "slug",          limit: 255
  end

  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "role_id", limit: 4
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
