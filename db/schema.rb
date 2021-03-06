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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20160909194236) do

  create_table "items", :force => true do |t|
    t.string   "block_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "items", ["block_id"], :name => "index_items_on_block_id"
  add_index "items", ["name"], :name => "index_items_on_name"

  create_table "reports", :force => true do |t|
    t.integer  "shop_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "reports", ["shop_id"], :name => "index_reports_on_shop_id"

  create_table "shops", :force => true do |t|
    t.string   "output_item_name"
    t.integer  "input_amount"
    t.string   "input_item_name"
    t.float    "location_x"
    t.float    "location_y"
    t.float    "location_z"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "output_amount"
    t.string   "world_uuid"
    t.integer  "reports_count",       :default => 0
    t.integer  "output_item_id"
    t.integer  "input_item_id"
    t.integer  "which",               :default => 1, :null => false
    t.integer  "exchanges_available", :default => 0, :null => false
  end

  add_index "shops", ["input_item_id"], :name => "index_shops_on_input_item_id"
  add_index "shops", ["output_item_id"], :name => "index_shops_on_item_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "state"
  end

  add_index "users", ["username"], :name => "index_users_on_username"

end
