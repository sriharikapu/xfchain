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

ActiveRecord::Schema.define(version: 20180218051346) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "products", force: :cascade do |t|
    t.integer "upc_id"
    t.integer "contract_id"
    t.string "wallet_key"
    t.string "public_id"
    t.string "public_key"
    t.string "private_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["private_key"], name: "index_products_on_private_key", unique: true
    t.index ["public_id"], name: "index_products_on_public_id", unique: true
    t.index ["public_key"], name: "index_products_on_public_key", unique: true
  end

  create_table "upcs", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
