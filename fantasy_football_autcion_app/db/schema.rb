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

ActiveRecord::Schema.define(version: 20150909153541) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "franchises", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "league_id"
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "franchises", ["league_id"], name: "index_franchises_on_league_id", using: :btree
  add_index "franchises", ["user_id"], name: "index_franchises_on_user_id", using: :btree

  create_table "leagues", force: :cascade do |t|
    t.integer  "mfl_id"
    t.string   "name",                                 null: false
    t.decimal  "salary_cap",   precision: 6, scale: 2
    t.integer  "roster_spots"
    t.integer  "num_of_teams",                         null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.string   "mfl_id"
    t.decimal  "salary"
    t.integer  "contract_length"
    t.integer  "roster_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "players", ["roster_id"], name: "index_players_on_roster_id", using: :btree

  create_table "rosters", force: :cascade do |t|
    t.integer  "franchise_id"
    t.integer  "league_id"
    t.integer  "player_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "rosters", ["franchise_id"], name: "index_rosters_on_franchise_id", using: :btree
  add_index "rosters", ["league_id"], name: "index_rosters_on_league_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "token",           null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["token"], name: "index_users_on_token", unique: true, using: :btree

  add_foreign_key "franchises", "leagues"
  add_foreign_key "franchises", "users"
  add_foreign_key "players", "rosters"
  add_foreign_key "rosters", "franchises"
  add_foreign_key "rosters", "leagues"
end
