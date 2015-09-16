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

ActiveRecord::Schema.define(version: 20150915212310) do

  create_table "documents", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "source"
    t.string   "url"
    t.text     "original_text"
    t.text     "analysis"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "documents", ["user_id"], name: "index_documents_on_user_id"

  create_table "english_phrases", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "tokipona_phrase_id"
    t.string   "base_form"
    t.string   "role"
    t.text     "forms"
    t.integer  "uses"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "english_phrases", ["tokipona_phrase_id"], name: "index_english_phrases_on_tokipona_phrase_id"
  add_index "english_phrases", ["user_id"], name: "index_english_phrases_on_user_id"

  create_table "phrase_pairings", force: :cascade do |t|
    t.integer  "translation_id"
    t.integer  "english_phrase_id"
    t.integer  "place"
    t.string   "english_form"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "phrase_pairings", ["english_phrase_id"], name: "index_phrase_pairings_on_english_phrase_id"
  add_index "phrase_pairings", ["translation_id"], name: "index_phrase_pairings_on_translation_id"

  create_table "tokipona_phrases", force: :cascade do |t|
    t.string   "words"
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "translations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "document_id"
    t.text     "analysis"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "translations", ["document_id"], name: "index_translations_on_document_id"
  add_index "translations", ["user_id"], name: "index_translations_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
