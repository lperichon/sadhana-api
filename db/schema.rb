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

ActiveRecord::Schema.define(version: 20140604020204) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.integer  "resource_id",               null: false
    t.string   "resource_type", limit: 255, null: false
    t.integer  "author_id"
    t.string   "author_type",   limit: 255
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace",     limit: 255
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_admin_notes_on_resource_type_and_resource_id", using: :btree

  create_table "admins", force: :cascade do |t|
    t.string   "email",                limit: 255, default: "", null: false
    t.string   "encrypted_password",   limit: 128, default: "", null: false
    t.string   "password_salt",        limit: 255, default: "", null: false
    t.string   "reset_password_token", limit: 255
    t.integer  "sign_in_count",                    default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",   limit: 255
    t.string   "last_sign_in_ip",      limit: 255
    t.integer  "failed_attempts",                  default: 0
    t.string   "unlock_token",         limit: 255
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  add_index "admins", ["unlock_token"], name: "index_admins_on_unlock_token", unique: true, using: :btree

  create_table "authentications", force: :cascade do |t|
    t.integer "user_id"
    t.string  "provider", limit: 255
    t.string  "uid",      limit: 255
    t.string  "token",    limit: 255
  end

  create_table "part_translations", force: :cascade do |t|
    t.integer  "part_id"
    t.string   "locale",     limit: 255
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "part_translations", ["part_id", "locale"], name: "index_part_translations_on_part_id_and_locale", unique: true, using: :btree

  create_table "parts", force: :cascade do |t|
    t.string  "symbol",            limit: 255
    t.integer "technique_type_id"
  end

  create_table "parts_technique_types", id: false, force: :cascade do |t|
    t.integer "part_id"
    t.integer "technique_type_id"
  end

  create_table "practice_events", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "practice_id"
    t.datetime "start"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "practice_parts", force: :cascade do |t|
    t.integer  "practice_id"
    t.integer  "part_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "practice_techniques", force: :cascade do |t|
    t.integer  "practice_id"
    t.integer  "technique_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.integer  "minutes"
    t.integer  "seconds"
    t.boolean  "compensate"
    t.text     "observations"
    t.integer  "practice_part_id"
  end

  create_table "practice_techniques_techniques", id: false, force: :cascade do |t|
    t.integer "practice_technique_id"
    t.integer "technique_id"
  end

  create_table "practices", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "delay"
    t.integer  "user_id"
    t.integer  "position"
    t.boolean  "continuous"
    t.string   "sound_filename", limit: 255
    t.string   "state",          limit: 255, default: "created"
    t.boolean  "public"
    t.boolean  "one_sec_a_day",              default: false
  end

  create_table "shared_practices", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "practice_id"
  end

  create_table "subscription_plans", force: :cascade do |t|
    t.string   "name",                   limit: 255,                 null: false
    t.integer  "rate_cents",                         default: 0
    t.integer  "interval",                           default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "max_practices"
    t.boolean  "available"
    t.boolean  "share_practices",                    default: false
    t.boolean  "one_sec_a_day_training",             default: false
    t.string   "stripe_id",              limit: 255
  end

  create_table "subscription_profiles", force: :cascade do |t|
    t.integer  "subscription_id"
    t.string   "state",               limit: 255
    t.string   "profile_key",         limit: 255
    t.string   "card_first_name",     limit: 255
    t.string   "card_last_name",      limit: 255
    t.string   "card_type",           limit: 255
    t.string   "card_display_number", limit: 255
    t.date     "card_expires_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscription_transactions", force: :cascade do |t|
    t.integer  "subscription_id",             null: false
    t.integer  "amount_cents"
    t.boolean  "success"
    t.string   "reference",       limit: 255
    t.string   "message",         limit: 255
    t.string   "action",          limit: 255
    t.text     "params"
    t.boolean  "test"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "subscriber_id",                                 null: false
    t.string   "subscriber_type",       limit: 255,             null: false
    t.integer  "plan_id"
    t.string   "state",                 limit: 255
    t.date     "next_renewal_on"
    t.integer  "warning_level"
    t.integer  "balance_cents",                     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "stripe_customer_token", limit: 255
  end

  add_index "subscriptions", ["next_renewal_on"], name: "index_subscriptions_on_next_renewal_on", using: :btree
  add_index "subscriptions", ["state"], name: "index_subscriptions_on_state", using: :btree
  add_index "subscriptions", ["subscriber_id"], name: "index_subscriptions_on_subscriber_id", using: :btree
  add_index "subscriptions", ["subscriber_type"], name: "index_subscriptions_on_subscriber_type", using: :btree

  create_table "technique_categories", force: :cascade do |t|
    t.integer "code"
  end

  create_table "technique_category_translations", force: :cascade do |t|
    t.integer  "technique_category_id"
    t.string   "locale",                limit: 255
    t.string   "name",                  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "technique_translations", force: :cascade do |t|
    t.integer  "technique_id"
    t.string   "locale",       limit: 255
    t.string   "name",         limit: 255
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "technique_translations", ["technique_id", "locale"], name: "index_technique_translations_on_technique_id_and_locale", unique: true, using: :btree

  create_table "technique_type_translations", force: :cascade do |t|
    t.integer  "technique_type_id"
    t.string   "locale",            limit: 255
    t.string   "name",              limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "technique_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "symbol",     limit: 255
  end

  create_table "techniques", force: :cascade do |t|
    t.string   "name",                  limit: 255
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "technique_type_id"
    t.string   "code",                  limit: 255
    t.string   "photo_file_name",       limit: 255
    t.string   "photo_content_type",    limit: 255
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "parent_id"
    t.integer  "technique_category_id"
  end

  create_table "user_contacts", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "contact_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: ""
    t.string   "password_salt",          limit: 255, default: ""
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token",   limit: 255
    t.string   "remember_token",         limit: 255
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "locale",                 limit: 255
    t.string   "invitation_token",       limit: 20
    t.datetime "invitation_sent_at"
    t.text     "google_consumer"
    t.text     "yahoo_consumer"
    t.datetime "invitation_accepted_at"
    t.string   "authentication_token",   limit: 255
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
