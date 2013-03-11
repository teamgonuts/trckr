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

ActiveRecord::Schema.define(:version => 20130311210639) do

  create_table "admin_users", :force => true do |t|
    t.string   "first_name",      :limit => 25
    t.string   "last_name",       :limit => 40
    t.string   "email",           :limit => 100, :default => "", :null => false
    t.string   "hashed_password", :limit => 30
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.string   "username",        :limit => 25
    t.string   "salt",            :limit => 40
  end

  add_index "admin_users", ["username"], :name => "index_admin_users_on_username"

  create_table "comments", :force => true do |t|
    t.integer  "item_id"
    t.string   "user"
    t.string   "location"
    t.string   "picture_path"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "comments", ["item_id"], :name => "index_comments_on_item_id"

  create_table "item_edits", :force => true do |t|
    t.integer  "admin_user_id"
    t.integer  "item_id"
    t.string   "summary"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "item_edits", ["admin_user_id", "item_id"], :name => "index_item_edits_on_admin_user_id_and_item_id"

  create_table "items", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "origin"
    t.string   "original_owner"
    t.string   "current_owner"
    t.string   "picture_path"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "uid"
    t.string   "message"
  end

end
