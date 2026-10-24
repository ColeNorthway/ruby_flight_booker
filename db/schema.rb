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

ActiveRecord::Schema[8.1].define(version: 2026_10_24_081851) do
  create_table "airports", force: :cascade do |t|
    t.string "city", null: false
    t.string "country", null: false
    t.string "name", null: false
    t.string "code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_airports_on_code", unique: true
  end

  create_table "flights", force: :cascade do |t|
    t.date "departure_time", null: false
    t.date "arrival_time", null: false
    t.integer "duration_minutes", null: false
    t.integer "delay_time_minutes", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "source_airport", null: false
    t.string "destination_airport", null: false
  end

  create_table "flights_passengers", id: false, force: :cascade do |t|
    t.integer "passenger_id", null: false
    t.integer "flight_id", null: false
    t.index ["flight_id"], name: "index_flights_passengers_on_flight_id"
    t.index ["passenger_id"], name: "index_flights_passengers_on_passenger_id"
  end

  create_table "passenger_profiles", force: :cascade do |t|
    t.date "dob", null: false
    t.string "ssn", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.boolean "gender", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "passenger_id", null: false
    t.index ["passenger_id"], name: "index_passenger_profiles_on_passenger_id", unique: true
    t.index ["ssn"], name: "index_passenger_profiles_on_ssn", unique: true
  end

  create_table "passengers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "flights", "airports", column: "destination_airport"
  add_foreign_key "flights", "airports", column: "source_airport"
  add_foreign_key "passenger_profiles", "passengers"
end
