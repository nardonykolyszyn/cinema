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

ActiveRecord::Schema.define(version: 2019_07_29_002452) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "document_type", default: 0
    t.string "document_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "functions", force: :cascade do |t|
    t.date "show_at"
    t.bigint "movie_id"
    t.bigint "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_functions_on_movie_id"
    t.index ["room_id"], name: "index_functions_on_room_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.integer "gender", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "identifier", null: false
    t.integer "capacity", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "aasm_state"
  end

  create_table "show_functions", force: :cascade do |t|
    t.bigint "function_id"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "client_id"
    t.index ["client_id"], name: "index_show_functions_on_client_id"
    t.index ["function_id"], name: "index_show_functions_on_function_id"
  end

  add_foreign_key "functions", "movies", on_delete: :cascade
  add_foreign_key "functions", "rooms", on_delete: :cascade
  add_foreign_key "show_functions", "clients", on_delete: :cascade
  add_foreign_key "show_functions", "functions", on_delete: :cascade
end
