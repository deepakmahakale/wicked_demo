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

ActiveRecord::Schema[7.0].define(version: 2022_09_14_125326) do
  create_table "addresses", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "address_line1"
    t.string "address_line2"
    t.string "city"
    t.string "zip"
    t.string "country_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "age"
    t.string "gender"
    t.datetime "date_of_birth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "auth_provider_name", null: false
    t.string "auth_user_id", null: false
    t.string "auth_user_email", null: false
    t.index ["auth_provider_name"], name: "index_users_on_auth_provider_name"
    t.index ["auth_user_email"], name: "index_users_on_auth_user_email"
    t.index ["auth_user_id"], name: "index_users_on_auth_user_id"
  end

  add_foreign_key "addresses", "users"
end
