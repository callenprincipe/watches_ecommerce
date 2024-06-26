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

ActiveRecord::Schema[7.1].define(version: 2024_04_18_182413) do
  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "case_materials", force: :cascade do |t|
    t.string "material"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "crystal_materials", force: :cascade do |t|
    t.string "material"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "address"
    t.integer "province_id", null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["province_id"], name: "index_customers_on_province_id"
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "dial_colors", force: :cascade do |t|
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "models", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movement_types", force: :cascade do |t|
    t.string "movement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_details", force: :cascade do |t|
    t.integer "quantity"
    t.decimal "price_at_order"
    t.integer "watch_id", null: false
    t.integer "order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "hst_at_order"
    t.decimal "pst_at_order"
    t.decimal "gst_at_order"
    t.index ["order_id"], name: "index_order_details_on_order_id"
    t.index ["watch_id"], name: "index_order_details_on_watch_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.string "order_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "provinces", force: :cascade do |t|
    t.string "name"
    t.decimal "pst"
    t.decimal "gst"
    t.decimal "hst"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "strap_materials", force: :cascade do |t|
    t.string "material"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "watches", force: :cascade do |t|
    t.integer "model_id", null: false
    t.integer "brand_id", null: false
    t.integer "case_material_id", null: false
    t.integer "strap_material_id", null: false
    t.integer "crystal_material_id", null: false
    t.integer "dial_color_id", null: false
    t.integer "movement_type_id", null: false
    t.integer "water_resistance"
    t.decimal "case_diameter"
    t.decimal "case_thickness"
    t.integer "band_width"
    t.decimal "current_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_watches_on_brand_id"
    t.index ["case_material_id"], name: "index_watches_on_case_material_id"
    t.index ["crystal_material_id"], name: "index_watches_on_crystal_material_id"
    t.index ["dial_color_id"], name: "index_watches_on_dial_color_id"
    t.index ["model_id"], name: "index_watches_on_model_id"
    t.index ["movement_type_id"], name: "index_watches_on_movement_type_id"
    t.index ["strap_material_id"], name: "index_watches_on_strap_material_id"
  end

  add_foreign_key "customers", "provinces"
  add_foreign_key "order_details", "orders"
  add_foreign_key "order_details", "watches"
  add_foreign_key "orders", "customers"
  add_foreign_key "watches", "brands"
  add_foreign_key "watches", "case_materials"
  add_foreign_key "watches", "crystal_materials"
  add_foreign_key "watches", "dial_colors"
  add_foreign_key "watches", "models"
  add_foreign_key "watches", "movement_types"
  add_foreign_key "watches", "strap_materials"
end
