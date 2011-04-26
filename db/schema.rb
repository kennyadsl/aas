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

ActiveRecord::Schema.define(:version => 20110426154548) do

  create_table "events", :force => true do |t|
    t.text     "body"
    t.datetime "date"
    t.string   "location"
    t.string   "opponent"
    t.boolean  "is_indoor"
    t.integer  "result_home"
    t.integer  "result_guest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news", :force => true do |t|
    t.text     "body"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", :force => true do |t|
    t.string   "full_name"
    t.string   "occupation"
    t.string   "city"
    t.string   "role"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

end
