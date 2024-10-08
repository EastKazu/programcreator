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

ActiveRecord::Schema[7.0].define(version: 2024_09_17_030039) do
  create_table "composers", charset: "utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", charset: "utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", charset: "utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instruments", charset: "utf8", force: :cascade do |t|
    t.text "instrument_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "piece_instruments", charset: "utf8", force: :cascade do |t|
    t.integer "piece_id", null: false
    t.integer "instrument_id", null: false
    t.integer "quantity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pieces", charset: "utf8", force: :cascade do |t|
    t.text "piece_name", null: false
    t.integer "composer_id", null: false
    t.integer "duration", null: false
    t.integer "genre_id", null: false
    t.integer "year_composed", null: false
    t.integer "country_id", null: false
    t.text "remarks"
    t.integer "timestamps", null: false
  end

end
