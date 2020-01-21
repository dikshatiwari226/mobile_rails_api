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

ActiveRecord::Schema.define(version: 2020_01_20_052129) do

  create_table "applied_jobs", force: :cascade do |t|
    t.integer "position"
    t.string "company"
    t.string "application_no"
    t.datetime "date_applied"
    t.integer "application_status"
    t.boolean "resume_submit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "businesses", force: :cascade do |t|
    t.string "person_name"
    t.string "business_name"
    t.string "business_gst_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_informations", force: :cascade do |t|
    t.string "job_title"
    t.string "company_name"
    t.string "job_description"
    t.string "company_location"
    t.datetime "post_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "jobTitle"
    t.string "gender"
    t.integer "contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authentication_token"
    t.string "name"
    t.string "gender"
    t.string "contact"
    t.string "dob"
    t.string "address"
    t.string "profession"
    t.string "image"
    t.string "role", default: "user"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
