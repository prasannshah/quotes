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

ActiveRecord::Schema.define(version: 20161217050939) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "quote_requests", force: :cascade do |t|
    t.string   "transit_type"
    t.string   "requester"
    t.string   "commodity"
    t.hstore   "port_of_loading"
    t.hstore   "port_of_discharge"
    t.string   "to_address"
    t.string   "from_address"
    t.json     "air_packages"
    t.decimal  "shipment_valuation"
    t.boolean  "hazardous"
    t.boolean  "insurance"
    t.boolean  "temp_controlled"
    t.integer  "min_temperature"
    t.integer  "max_temperature"
    t.hstore   "other_services_charges"
    t.datetime "shipment_ready_date"
    t.datetime "shipment_clearance_date"
    t.string   "carrier_preference"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "quote_responses", force: :cascade do |t|
    t.integer  "quote_request_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["quote_request_id"], name: "index_quote_responses_on_quote_request_id", using: :btree
  end

  create_table "quotes", force: :cascade do |t|
    t.integer  "quote_response_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["quote_response_id"], name: "index_quotes_on_quote_response_id", using: :btree
  end

end
