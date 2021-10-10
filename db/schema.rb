# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_10_110134) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_enum :appointments_status_types, [
    "scheduled",
    "started",
    "finished",
    "canceled",
  ], force: :cascade

  create_table "addresses", id: :binary, force: :cascade do |t|
    t.string "addressable_type", null: false
    t.binary "addressable_id", null: false
    t.string "name"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "references"
    t.string "zip_code"
    t.string "custom_address"
    t.boolean "is_primary"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable"
  end

  create_table "appointments", id: :binary, force: :cascade do |t|
    t.binary "created_by_id", null: false
    t.binary "canceled_by_id"
    t.binary "service_id", null: false
    t.datetime "canceled_at"
    t.datetime "date_at"
    t.enum "status", default: "scheduled", enum_name: "appointments_status_types"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["canceled_by_id"], name: "index_appointments_on_canceled_by_id"
    t.index ["created_by_id"], name: "index_appointments_on_created_by_id"
    t.index ["service_id"], name: "index_appointments_on_service_id"
  end

  create_table "jwt_blacklists", force: :cascade do |t|
    t.string "jti"
    t.datetime "exp"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["jti"], name: "index_jwt_blacklists_on_jti"
  end

  create_table "oauth_access_grants", force: :cascade do |t|
    t.binary "resource_owner_id", null: false
    t.bigint "application_id"
    t.string "token", null: false
    t.integer "expires_in", null: false
    t.text "redirect_uri", null: false
    t.datetime "created_at", null: false
    t.datetime "revoked_at"
    t.string "scopes", default: "", null: false
    t.index ["application_id"], name: "index_oauth_access_grants_on_application_id"
    t.index ["resource_owner_id"], name: "index_oauth_access_grants_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_grants_on_token", unique: true
  end

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.binary "resource_owner_id"
    t.bigint "application_id"
    t.string "token", null: false
    t.string "refresh_token"
    t.integer "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at", null: false
    t.string "scopes"
    t.string "previous_refresh_token", default: "", null: false
    t.index ["application_id"], name: "index_oauth_access_tokens_on_application_id"
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true
  end

  create_table "oauth_applications", force: :cascade do |t|
    t.string "name", null: false
    t.string "uid", null: false
    t.string "secret", null: false
    t.text "redirect_uri", null: false
    t.string "scopes", default: "", null: false
    t.boolean "confidential", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["uid"], name: "index_oauth_applications_on_uid", unique: true
  end

  create_table "purchase_items", id: :binary, force: :cascade do |t|
    t.binary "service_id", null: false
    t.integer "quantity"
    t.decimal "price", precision: 20, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["service_id"], name: "index_purchase_items_on_service_id"
  end

  create_table "purchases", id: :binary, force: :cascade do |t|
    t.binary "service_id", null: false
    t.decimal "total", precision: 20, scale: 2
    t.decimal "subtotal", precision: 20, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["service_id"], name: "index_purchases_on_service_id"
  end

  create_table "services", id: :binary, force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.binary "supplier_id", null: false
    t.jsonb "custom_features"
    t.decimal "price", precision: 20, scale: 2
    t.boolean "is_home_service", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["supplier_id"], name: "index_services_on_supplier_id"
  end

  create_table "suppliers", id: :binary, force: :cascade do |t|
    t.string "company_name"
    t.string "description"
    t.string "phone_country_code"
    t.string "phone_number"
    t.string "email"
    t.binary "user_id", null: false
    t.index ["user_id"], name: "index_suppliers_on_user_id"
  end

  create_table "users", id: :binary, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "last_name"
    t.string "phone_number"
    t.string "phone_country_code"
    t.date "birth_date"
    t.string "second_last_name"
    t.string "auth_token"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appointments", "services"
  add_foreign_key "appointments", "users", column: "canceled_by_id"
  add_foreign_key "appointments", "users", column: "created_by_id"
  add_foreign_key "oauth_access_grants", "oauth_applications", column: "application_id"
  add_foreign_key "oauth_access_grants", "users", column: "resource_owner_id"
  add_foreign_key "oauth_access_tokens", "oauth_applications", column: "application_id"
  add_foreign_key "oauth_access_tokens", "users", column: "resource_owner_id"
  add_foreign_key "purchase_items", "services"
  add_foreign_key "purchases", "services"
  add_foreign_key "services", "suppliers"
  add_foreign_key "suppliers", "users"
end
