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

ActiveRecord::Schema.define(version: 20131117205058) do

  create_table "filters", force: true do |t|
    t.string   "filter_type"
    t.integer  "user_id",                    null: false
    t.string   "name",        default: "",   null: false
    t.text     "filter",      default: "",   null: false
    t.text     "description"
    t.boolean  "active",      default: true
    t.integer  "position",    default: 0,    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "filters", ["user_id"], name: "index_filters_on_user_id"

  create_table "imports", force: true do |t|
    t.integer  "user_id"
    t.string   "klass",                                       null: false
    t.string   "file_uid",                                    null: false
    t.string   "file_name"
    t.string   "file_mime_type"
    t.integer  "file_size"
    t.string   "report_uid"
    t.string   "report_name"
    t.string   "report_mime_type"
    t.integer  "num_errors",       default: 0,                null: false
    t.integer  "num_imported",     default: 0,                null: false
    t.string   "state",            default: "not_configured", null: false
    t.string   "action_name",      default: "import",         null: false
    t.text     "configuration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "imports", ["klass", "user_id"], name: "index_imports_on_klass_and_user_id"
  add_index "imports", ["user_id"], name: "index_imports_on_user_id"

  create_table "imports_importables", force: true do |t|
    t.integer "import_id"
    t.integer "importable_id"
    t.string  "importable_type"
  end

  add_index "imports_importables", ["import_id"], name: "index_imports_importables_on_import_id"
  add_index "imports_importables", ["importable_id"], name: "index_imports_importables_on_importable_id"

  create_table "projects", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "start"
    t.date     "end"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["user_id"], name: "index_projects_on_user_id"

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
