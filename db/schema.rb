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

ActiveRecord::Schema.define(version: 20170218181443) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "image_url"
    t.integer  "owner_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["owner_id"], name: "index_projects_on_owner_id", using: :btree
  end

  create_table "source_accounts", force: :cascade do |t|
    t.string   "service"
    t.integer  "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_source_accounts_on_owner_id", using: :btree
  end

  create_table "source_transactions", force: :cascade do |t|
    t.string   "external_id"
    t.string   "description"
    t.integer  "price_cents"
    t.integer  "source_account_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["source_account_id"], name: "index_source_transactions_on_source_account_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.string   "image_url"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "sign_in_count",      default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "projects", "users", column: "owner_id"
  add_foreign_key "source_accounts", "users", column: "owner_id"
  add_foreign_key "source_transactions", "source_accounts"
end
