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

ActiveRecord::Schema.define(:version => 20121215224113) do

  create_table "reports", :force => true do |t|
    t.integer  "shop_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "shops", :force => true do |t|
    t.string   "item"
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
  end

end
