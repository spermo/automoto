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

<<<<<<< HEAD
ActiveRecord::Schema.define(:version => 20110616140754) do
=======
ActiveRecord::Schema.define(:version => 20110616132514) do

  create_table "articles", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  add_index "articles", ["user_id"], :name => "index_articles_on_user_id"
>>>>>>> 20860ffe8f23ba19aceef6b3aef85f146e0d734e

  create_table "boards", :force => true do |t|
    t.string   "title",      :limit => 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "conversation_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["conversation_id"], :name => "index_comments_on_conversation_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "conversations", :force => true do |t|
    t.string   "title",      :limit => 50
    t.integer  "board_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "conversations", ["board_id"], :name => "index_conversations_on_board_id"
  add_index "conversations", ["user_id"], :name => "index_conversations_on_user_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
<<<<<<< HEAD
    t.integer  "role_id"
=======
    t.boolean  "admin",              :default => false
>>>>>>> 20860ffe8f23ba19aceef6b3aef85f146e0d734e
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
