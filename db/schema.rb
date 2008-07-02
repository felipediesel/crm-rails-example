# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080702180051) do

  create_table "contracts", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "code",        :null => false
    t.text     "description", :null => false
    t.string   "status",      :null => false
    t.datetime "started_at",  :null => false
    t.datetime "ended_at"
    t.float    "value"
    t.integer  "leader_id",   :null => false
    t.integer  "project_id",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", :force => true do |t|
    t.string   "name",               :null => false
    t.text     "description"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "phone_country_code"
    t.integer  "phone_area_code"
    t.string   "phone_number"
  end

  create_table "logs", :force => true do |t|
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active"
  end

  create_table "projects_members", :id => false, :force => true do |t|
    t.integer "project_id", :null => false
    t.integer "member_id",  :null => false
  end

  create_table "tasks", :force => true do |t|
    t.string   "title",       :null => false
    t.text     "description", :null => false
    t.string   "status",      :null => false
    t.integer  "owner_id",    :null => false
    t.string   "priority",    :null => false
    t.integer  "progress"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.integer  "project_id",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name",                     :null => false
    t.string   "login",      :limit => 16, :null => false
    t.string   "password",                 :null => false
    t.string   "kind",                     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
