# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_14_123147) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "invoice_addresses", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "street"
    t.integer "zip_code"
    t.string "city"
    t.string "country"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "subscription_id", null: false
    t.bigint "payment_type_id", null: false
    t.bigint "invoice_address_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["invoice_address_id"], name: "index_orders_on_invoice_address_id"
    t.index ["payment_type_id"], name: "index_orders_on_payment_type_id"
    t.index ["subscription_id"], name: "index_orders_on_subscription_id"
  end

  create_table "payment_types", force: :cascade do |t|
    t.string "amazon_pay"
    t.string "paypal"
    t.string "name"
    t.string "card_number"
    t.integer "cvc"
    t.date "expiry_date"
    t.integer "IBAN"
    t.string "BIC"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "payment_type"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "plan_type"
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "duration_in_months"
    t.string "choice_of_payment"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "orders", "invoice_addresses"
  add_foreign_key "orders", "payment_types"
  add_foreign_key "orders", "subscriptions"
end
