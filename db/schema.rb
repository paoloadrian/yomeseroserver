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

ActiveRecord::Schema.define(version: 20150810003930) do

  create_table "items", force: :cascade do |t|
    t.string   "item_name"
    t.text     "item_description"
    t.string   "item_type"
    t.integer  "item_time"
    t.float    "item_price"
    t.string   "item_image"
    t.integer  "restaurant_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "items", ["restaurant_id"], name: "index_items_on_restaurant_id"

  create_table "mesas", force: :cascade do |t|
    t.integer  "numero"
    t.string   "estado"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "mesas", ["restaurant_id"], name: "index_mesas_on_restaurant_id"

  create_table "orden_items", force: :cascade do |t|
    t.integer  "cantidad"
    t.integer  "id_item"
    t.integer  "id_orden"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "orden_id"
    t.integer  "item_id"
    t.string   "item_name"
    t.string   "item_image"
    t.string   "item_type"
  end

  add_index "orden_items", ["item_id"], name: "index_orden_items_on_item_id"
  add_index "orden_items", ["orden_id"], name: "index_orden_items_on_orden_id"

  create_table "ordens", force: :cascade do |t|
    t.integer  "mesa"
    t.float    "consumo"
    t.integer  "rest"
    t.string   "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "nit"
    t.string   "name"
  end

  create_table "pedido_items", force: :cascade do |t|
    t.integer  "quantity"
    t.integer  "pedido_id"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pedido_items", ["item_id"], name: "index_pedido_items_on_item_id"
  add_index "pedido_items", ["pedido_id"], name: "index_pedido_items_on_pedido_id"

  create_table "pedidos", force: :cascade do |t|
    t.float    "consumo"
    t.string   "estado"
    t.integer  "restaurant_id"
    t.integer  "mesa"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "restaurant_name"
    t.text     "restaurant_description"
    t.string   "restaurant_type"
    t.string   "restaurant_address"
    t.string   "restaurant_phone"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "rest"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "nit"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
