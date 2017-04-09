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

ActiveRecord::Schema.define(version: 20170409132009) do

  create_table "appointments", force: :cascade do |t|
    t.integer "doctor_id"
    t.integer "patient_id"
    t.date "date"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
  end

  create_table "conditions", force: :cascade do |t|
    t.text "description"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "doctors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "qualifications"
    t.string "hospital"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone_office"
    t.string "phone_mobile"
    t.date "date_of_birth"
    t.index ["user_id"], name: "index_doctors_on_user_id"
  end

  create_table "icd10s", force: :cascade do |t|
    t.string "code"
    t.text "description"
    t.text "additional"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_icd10s_on_code", unique: true
  end

  create_table "patient_conditions", force: :cascade do |t|
    t.integer "patient_id"
    t.integer "doctor_id"
    t.date "reported"
    t.date "cured"
    t.text "notes"
    t.integer "condition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "icd10_id"
    t.index ["condition_id"], name: "index_patient_conditions_on_condition_id"
    t.index ["doctor_id"], name: "index_patient_conditions_on_doctor_id"
    t.index ["icd10_id"], name: "index_patient_conditions_on_icd10_id"
    t.index ["patient_id"], name: "index_patient_conditions_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.text "address"
    t.bigint "phone_number"
    t.text "notes"
    t.text "allergies"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
