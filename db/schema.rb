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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110214041728) do

  create_table "answers", :force => true do |t|
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "answer_text"
  end

  create_table "events", :force => true do |t|
    t.string   "name",                                      :null => false
    t.integer  "location_id",                               :null => false
    t.datetime "start_time",                                :null => false
    t.datetime "end_time",                                  :null => false
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "capacity",                                  :null => false
    t.integer  "active_registrations_count", :default => 0
  end

  create_table "locations", :force => true do |t|
    t.string   "address"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", :force => true do |t|
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "question_text"
    t.string   "type"
  end

  create_table "registrations", :force => true do |t|
    t.integer  "user_id",      :null => false
    t.integer  "event_id",     :null => false
    t.boolean  "waitlisted"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "withdrawn_at"
  end

  add_index "registrations", ["event_id"], :name => "index_registrations_on_event_id"
  add_index "registrations", ["user_id", "event_id"], :name => "index_registrations_on_user_id_and_event_id"

  create_table "roles", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer  "role_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles_users", ["role_id", "user_id"], :name => "index_roles_users_on_role_id_and_user_id"
  add_index "roles_users", ["user_id"], :name => "index_roles_users_on_user_id"

  create_table "user_profiles", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                :default => "", :null => false
    t.string   "encrypted_password",    :limit => 128, :default => "", :null => false
    t.string   "password_salt",                        :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name",                                                 :null => false
    t.boolean  "female_identification"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
