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

ActiveRecord::Schema.define(version: 20170219010112) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coin_banks", force: :cascade do |t|
    t.integer  "owner_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.datetime "terminated_at"
    t.index ["owner_id"], name: "index_coin_banks_on_owner_id", using: :btree
  end

  create_table "project_users", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.integer  "percentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_users_on_project_id", using: :btree
    t.index ["user_id"], name: "index_project_users_on_user_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "image_url"
    t.integer  "owner_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["owner_id"], name: "index_projects_on_owner_id", using: :btree
  end

  create_table "savings", force: :cascade do |t|
    t.integer  "source_transaction_id"
    t.integer  "coin_bank_id"
    t.integer  "price_cents"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["coin_bank_id"], name: "index_savings_on_coin_bank_id", using: :btree
    t.index ["source_transaction_id"], name: "index_savings_on_source_transaction_id", using: :btree
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
    t.integer  "account_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.datetime "transaction_date"
    t.index ["account_id"], name: "index_source_transactions_on_account_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.string   "image_url"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "withdrawal_accounts", force: :cascade do |t|
    t.string   "service"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_withdrawal_accounts_on_project_id", using: :btree
  end

  create_table "withdrawal_transactions", force: :cascade do |t|
    t.integer  "price_cents"
    t.integer  "account_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["account_id"], name: "index_withdrawal_transactions_on_account_id", using: :btree
  end

  add_foreign_key "coin_banks", "users", column: "owner_id"
  add_foreign_key "project_users", "projects"
  add_foreign_key "project_users", "users"
  add_foreign_key "projects", "users", column: "owner_id"
  add_foreign_key "savings", "coin_banks"
  add_foreign_key "savings", "source_transactions"
  add_foreign_key "source_accounts", "users", column: "owner_id"
  add_foreign_key "source_transactions", "source_accounts", column: "account_id"
  add_foreign_key "withdrawal_accounts", "projects"
  add_foreign_key "withdrawal_transactions", "withdrawal_accounts", column: "account_id"
end
