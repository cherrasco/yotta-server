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

ActiveRecord::Schema.define(version: 20160130123743) do

  create_table "drives", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "run_informations", force: :cascade do |t|
    t.integer  "drive_id",       limit: 4
    t.float    "vehicle_speed",  limit: 24
    t.float    "engine_speed",   limit: 24
    t.decimal  "acceleration_x",            precision: 11, scale: 8
    t.decimal  "acceleration_y",            precision: 11, scale: 8
    t.decimal  "acceleration_z",            precision: 11, scale: 8
    t.decimal  "gyro_x",                    precision: 11, scale: 8
    t.decimal  "gyro_y",                    precision: 11, scale: 8
    t.decimal  "gyro_z",                    precision: 11, scale: 8
    t.float    "steering_wheel", limit: 24
    t.decimal  "latitude",                  precision: 11, scale: 8
    t.decimal  "longitude",                 precision: 11, scale: 8
    t.decimal  "altitude",                  precision: 11, scale: 8
    t.float    "gps_heading",    limit: 24
    t.float    "gps_speed",      limit: 24
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "run_informations", ["drive_id"], name: "index_run_informations_on_drive_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "type",         limit: 255
    t.string   "devise_token", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "users", ["devise_token"], name: "index_users_on_devise_token", using: :btree

end
