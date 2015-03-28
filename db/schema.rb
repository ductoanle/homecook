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

ActiveRecord::Schema.define(version: 20150328145554) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: true do |t|
    t.string  "line1"
    t.string  "line2"
    t.string  "city"
    t.string  "country_subdivision"
    t.string  "postal_code"
    t.string  "country"
    t.integer "user_id"
  end

  create_table "cards", force: true do |t|
    t.string  "account_number"
    t.integer "expiry_month"
    t.integer "expiry_year"
    t.integer "cvc"
    t.integer "owner_id"
  end

  create_table "categories", force: true do |t|
    t.string "name"
  end

  create_table "dishes", force: true do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.float    "price"
    t.integer  "quantity"
    t.datetime "last_order"
    t.string   "category"
    t.text     "description"
  end

  create_table "images", force: true do |t|
    t.string  "url"
    t.integer "resource_id"
    t.string  "resource_type"
    t.string  "name"
  end

  create_table "orders", force: true do |t|
    t.integer "dish_id"
    t.integer "buyer_id"
    t.integer "place_id"
    t.string  "status"
    t.float   "total"
    t.integer "quantity"
  end

  create_table "places", force: true do |t|
    t.string  "address"
    t.float   "longitude"
    t.float   "latitude"
    t.string  "timeslot"
    t.integer "owner_id"
    t.string  "area"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.string   "authentication_token"
    t.string   "confirmation_token"
    t.datetime "confirm_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "real_name"
  end

end
