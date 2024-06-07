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

ActiveRecord::Schema[7.1].define(version: 20_240_607_132_817) do
  create_table "appointments", force: :cascade do |t|
    t.datetime "date"
    t.time "time"
    t.integer "patients_id", null: false
    t.integer "specialist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patients_id"], name: "index_appointments_on_patients_id"
    t.index ["specialist_id"], name: "index_appointments_on_specialist_id"
  end

  create_table "availabilities", force: :cascade do |t|
    t.datetime "date"
    t.time "start_time"
    t.time "end_time"
    t.integer "specialist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["specialist_id"], name: "index_availabilities_on_specialist_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "specialists", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.string "email"
    t.string "phone"
    t.string "specialty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "appointments", "patients", column: "patients_id"
  add_foreign_key "appointments", "specialists"
  add_foreign_key "availabilities", "specialists"
end
