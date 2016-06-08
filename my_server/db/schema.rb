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

ActiveRecord::Schema.define(version: 20160430194506) do

  create_table "admins", primary_key: "user_id", force: :cascade do |t|
    t.integer  "id",         limit: 4,   null: false
    t.integer  "pin",        limit: 4,   null: false
    t.string   "gcmid",      limit: 255
    t.boolean  "logged_in",              null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "admins", ["gcmid"], name: "gcmid", unique: true, using: :btree
  add_index "admins", ["id"], name: "id", unique: true, using: :btree

  create_table "contacts", force: :cascade do |t|
    t.integer  "MemberId",     limit: 4,   null: false
    t.string   "Name",         limit: 255, null: false
    t.string   "Number",       limit: 255, null: false
    t.string   "Gender",       limit: 255, null: false
    t.string   "Clist_ids",    limit: 255, null: false
    t.string   "Resource_uri", limit: 255, null: false
    t.integer  "Age",          limit: 4,   null: false
    t.string   "District",     limit: 255, null: false
    t.string   "State",        limit: 255, null: false
    t.string   "Block",        limit: 255, null: false
    t.string   "Status",       limit: 255, null: false
    t.integer  "GVID",         limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "districts", primary_key: "DistrictId", force: :cascade do |t|
    t.string "DistrictName", limit: 20, null: false
    t.string "State",        limit: 20, null: false
  end

  add_index "districts", ["DistrictId"], name: "DistrictId", unique: true, using: :btree
  add_index "districts", ["DistrictId"], name: "DistrictId_2", using: :btree
  add_index "districts", ["DistrictName"], name: "DistrictName", unique: true, using: :btree

  create_table "groups", force: :cascade do |t|
    t.integer  "MemberId",   limit: 4
    t.string   "Name",       limit: 255
    t.string   "Status",     limit: 255
    t.integer  "GVID",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", primary_key: "TextId", force: :cascade do |t|
    t.integer  "MemberId",       limit: 4,     null: false
    t.integer  "Template_id",    limit: 4,     null: false
    t.text     "Message_params", limit: 65535, null: false
    t.text     "Contacts",       limit: 65535
    t.text     "Groups",         limit: 65535
    t.string   "Status",         limit: 10,    null: false
    t.integer  "GVID",           limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "messages", ["GVID"], name: "GVID", unique: true, using: :btree
  add_index "messages", ["MemberId"], name: "MemberId", using: :btree
  add_index "messages", ["TextId"], name: "TextId", unique: true, using: :btree

  create_table "ngo_users", force: :cascade do |t|
    t.string   "ngoname",       limit: 255
    t.string   "username",      limit: 255
    t.string   "password",      limit: 255
    t.string   "salt",          limit: 255
    t.integer  "age",           limit: 4
    t.integer  "phone",         limit: 8
    t.string   "city",          limit: 255
    t.string   "website",       limit: 255
    t.string   "email",         limit: 255
    t.string   "field",         limit: 255
    t.boolean  "authenticated",             default: false, null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "recordings", primary_key: "RecId", force: :cascade do |t|
    t.integer  "MemberId",    limit: 4,     null: false
    t.string   "RecFileName", limit: 50,    null: false
    t.text     "Contacts",    limit: 65535
    t.text     "Groups",      limit: 65535
    t.string   "Status",      limit: 20,    null: false
    t.integer  "GVID",        limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "recordings", ["MemberId"], name: "MemberId", using: :btree
  add_index "recordings", ["MemberId"], name: "MemberId_2", using: :btree
  add_index "recordings", ["RecId"], name: "RecId", unique: true, using: :btree

  create_table "rpush_apps", force: :cascade do |t|
    t.string   "name",                    limit: 255,               null: false
    t.string   "environment",             limit: 255
    t.text     "certificate",             limit: 65535
    t.string   "password",                limit: 255
    t.integer  "connections",             limit: 4,     default: 1, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type",                    limit: 255,               null: false
    t.string   "auth_key",                limit: 255
    t.string   "client_id",               limit: 255
    t.string   "client_secret",           limit: 255
    t.string   "access_token",            limit: 255
    t.datetime "access_token_expiration"
  end

  create_table "rpush_feedback", force: :cascade do |t|
    t.string   "device_token", limit: 64, null: false
    t.datetime "failed_at",               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "app_id",       limit: 4
  end

  add_index "rpush_feedback", ["device_token"], name: "index_rpush_feedback_on_device_token", using: :btree

  create_table "rpush_notifications", force: :cascade do |t|
    t.integer  "badge",             limit: 4
    t.string   "device_token",      limit: 64
    t.string   "sound",             limit: 255,      default: "default"
    t.string   "alert",             limit: 255
    t.text     "data",              limit: 65535
    t.integer  "expiry",            limit: 4,        default: 86400
    t.boolean  "delivered",                          default: false,     null: false
    t.datetime "delivered_at"
    t.boolean  "failed",                             default: false,     null: false
    t.datetime "failed_at"
    t.integer  "error_code",        limit: 4
    t.text     "error_description", limit: 65535
    t.datetime "deliver_after"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "alert_is_json",                      default: false
    t.string   "type",              limit: 255,                          null: false
    t.string   "collapse_key",      limit: 255
    t.boolean  "delay_while_idle",                   default: false,     null: false
    t.text     "registration_ids",  limit: 16777215
    t.integer  "app_id",            limit: 4,                            null: false
    t.integer  "retries",           limit: 4,        default: 0
    t.string   "uri",               limit: 255
    t.datetime "fail_after"
    t.boolean  "processing",                         default: false,     null: false
    t.integer  "priority",          limit: 4
    t.text     "url_args",          limit: 65535
    t.string   "category",          limit: 255
  end

  add_index "rpush_notifications", ["app_id", "delivered", "failed", "deliver_after"], name: "index_rapns_notifications_multi", using: :btree
  add_index "rpush_notifications", ["delivered", "failed"], name: "index_rpush_notifications_multi", using: :btree

  create_table "surveys", primary_key: "SurveyId", force: :cascade do |t|
    t.integer  "MemberId",   limit: 4,     null: false
    t.string   "SurveyName", limit: 50,    null: false
    t.text     "Contacts",   limit: 65535
    t.text     "Groups",     limit: 65535
    t.string   "Status",     limit: 10,    null: false
    t.integer  "GVID",       limit: 4,     null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "surveys", ["GVID"], name: "GVID", unique: true, using: :btree
  add_index "surveys", ["MemberId"], name: "MemberId", using: :btree
  add_index "surveys", ["SurveyId"], name: "SurveyId", unique: true, using: :btree

  create_table "tasks", primary_key: "TaskId", force: :cascade do |t|
    t.integer  "ItemId",     limit: 4,     null: false
    t.string   "TaskName",   limit: 50,    null: false
    t.string   "Status",     limit: 20,    null: false
    t.datetime "created_at",               null: false
    t.integer  "MemberId",   limit: 4,     null: false
    t.integer  "GVID",       limit: 4
    t.text     "Type",       limit: 65535, null: false
    t.text     "Contacts",   limit: 65535
    t.text     "Groups",     limit: 65535
    t.datetime "updated_at",               null: false
  end

  add_index "tasks", ["ItemId"], name: "ItemId", using: :btree
  add_index "tasks", ["TaskId"], name: "TaskId", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "contact",    limit: 255
    t.string   "gender",     limit: 255
    t.integer  "age",        limit: 4
    t.string   "city",       limit: 255
    t.string   "state",      limit: 255
    t.text     "block",      limit: 65535, null: false
    t.datetime "created_at"
    t.datetime "updated_at",               null: false
    t.string   "district",   limit: 255
  end

  add_foreign_key "admins", "users"
  add_foreign_key "admins", "users", column: "id", name: "id"
  add_foreign_key "admins", "users", name: "user_id"
end
