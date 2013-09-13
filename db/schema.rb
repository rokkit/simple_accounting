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

ActiveRecord::Schema.define(version: 20130913073547) do

  create_table "activities", force: true do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"

  create_table "bank_books", id: false, force: true do |t|
    t.integer  "id",                                                   null: false
    t.string   "name",                                   default: "",  null: false
    t.text     "bank_account"
    t.decimal  "amount",       precision: 20, scale: 10, default: 0.0
    t.decimal  "saldo",        precision: 20, scale: 10, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bank_books_users", force: true do |t|
    t.integer "bank_book_id", null: false
    t.integer "user_id",      null: false
  end

  add_index "bank_books_users", ["bank_book_id", "user_id"], name: "index_bank_books_users_on_bank_book_id_and_user_id", unique: true

  create_table "http_requests", force: true do |t|
    t.string   "method"
    t.string   "parameters"
    t.string   "ip_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "io_type_operations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "money_type_operations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "operations", force: true do |t|
    t.datetime "o_date",                                            default: '2013-09-05 13:39:58'
    t.integer  "from_id"
    t.decimal  "amount",                  precision: 20, scale: 10
    t.text     "description"
    t.integer  "user_id"
    t.integer  "money_type_operation_id"
    t.integer  "io_type_operation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bank_book_id"
    t.integer  "to_user_id"
  end

  add_index "operations", ["user_id"], name: "index_operations_on_user_id"

  create_table "plutus_accounts", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.boolean  "contra"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plutus_accounts", ["name", "type"], name: "index_plutus_accounts_on_name_and_type"

  create_table "plutus_amounts", force: true do |t|
    t.string  "type"
    t.integer "account_id"
    t.integer "transaction_id"
    t.decimal "amount",         precision: 20, scale: 10
  end

  add_index "plutus_amounts", ["account_id", "transaction_id"], name: "index_plutus_amounts_on_account_id_and_transaction_id"
  add_index "plutus_amounts", ["transaction_id", "account_id"], name: "index_plutus_amounts_on_transaction_id_and_account_id"
  add_index "plutus_amounts", ["type"], name: "index_plutus_amounts_on_type"

  create_table "plutus_transactions", force: true do |t|
    t.string   "description"
    t.integer  "commercial_document_id"
    t.string   "commercial_document_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plutus_transactions", ["commercial_document_id", "commercial_document_type"], name: "index_transactions_on_commercial_doc"

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.string   "fake_password"
    t.string   "alert_password"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
