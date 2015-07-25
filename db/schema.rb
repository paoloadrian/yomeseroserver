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

ActiveRecord::Schema.define(version: 20150725020403) do

  create_table "items", force: :cascade do |t|
    t.string   "item_name"
    t.text     "item_description"
    t.string   "item_type"
    t.integer  "item_time"
    t.float    "item_price"
    t.integer  "restaurant_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "items", ["restaurant_id"], name: "index_items_on_restaurant_id"

  create_table "order_items", force: :cascade do |t|
    t.integer  "quantity"
    t.integer  "order_id"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "order_items", ["item_id"], name: "index_order_items_on_item_id"
  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id"

  create_table "orders", force: :cascade do |t|
    t.float    "total"
    t.integer  "restaurant_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "orders", ["restaurant_id"], name: "index_orders_on_restaurant_id"
  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "restaurants", force: :cascade do |t|
    t.string   "restaurant_name"
    t.text     "restaurant_description"
    t.string   "restaurant_type"
    t.string   "restaurant_address"
    t.string   "restaurant_phone"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
