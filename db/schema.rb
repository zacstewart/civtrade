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

ActiveRecord::Schema.define(:version => 20121229161608) do

  create_table "bounties", :force => true do |t|
    t.string   "wanted_username"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "pledges_count"
  end

  add_index "bounties", ["wanted_username"], :name => "index_bounties_on_username"

  create_table "items", :force => true do |t|
    t.string   "block_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "items", ["block_id"], :name => "index_items_on_block_id"
  add_index "items", ["name"], :name => "index_items_on_name"

  create_table "pledges", :force => true do |t|
    t.integer  "bounty_id"
    t.string   "amount"
    t.string   "amount_currency"
    t.integer  "amount_value"
    t.text     "comment"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "username"
  end

  add_index "pledges", ["bounty_id"], :name => "index_pledges_on_bounty_id"

  create_table "reports", :force => true do |t|
    t.integer  "shop_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "reports", ["shop_id"], :name => "index_reports_on_shop_id"

  create_table "shops", :force => true do |t|
    t.string   "item_name"
    t.integer  "buy_price"
    t.string   "buy_currency"
    t.integer  "sell_price"
    t.string   "sell_currency"
    t.float    "location_x"
    t.float    "location_y"
    t.float    "location_z"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "buy_amount"
    t.integer  "sell_amount"
    t.string   "world"
    t.integer  "reports_count", :default => 0
    t.string   "city"
    t.integer  "item_id"
  end

  add_index "shops", ["item_id"], :name => "index_shops_on_item_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "state"
  end

  add_index "users", ["username"], :name => "index_users_on_username"

end
