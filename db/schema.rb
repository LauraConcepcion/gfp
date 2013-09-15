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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130912174506) do

  create_table "aacces", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "aacce_code"
  end

  create_table "absences", :force => true do |t|
    t.integer  "student_id"
    t.integer  "profile_id"
    t.datetime "absence_datetime"
    t.boolean  "justified"
    t.text     "observations"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "average_scores", :force => true do |t|
    t.float    "grade"
    t.text     "observations"
    t.integer  "student_id"
    t.integer  "tlresult_id"
    t.integer  "quarter_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.boolean  "teacher_revised", :default => false
    t.integer  "profile_id"
  end

  create_table "classroom_diaries", :force => true do |t|
    t.text     "description"
    t.integer  "profile_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "classrooms", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "code_import"
    t.integer  "profile_id"
  end

  create_table "classrooms_students", :id => false, :force => true do |t|
    t.integer "classroom_id", :null => false
    t.integer "student_id",   :null => false
  end

  create_table "contentblocks", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "matter_id"
    t.integer  "quarter_id"
    t.integer  "tlresult_id"
    t.integer  "aacce_id"
    t.string   "cb_id"
  end

  create_table "contentblocks_qualifyingentities", :force => true do |t|
    t.integer "contentblock_id"
    t.integer "qualifyingentity_id"
  end

  create_table "contents", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "criterion_id"
    t.integer  "contentblock_id"
    t.string   "c_id"
  end

  create_table "criterions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "content_id"
    t.integer  "tlresult_id"
  end

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "institute_id"
    t.integer  "aacce_id"
    t.integer  "departmenttype_id"
  end

  create_table "departments_teachers", :id => false, :force => true do |t|
    t.integer "department_id"
    t.integer "teacher_id"
  end

  create_table "departmenttypes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "departmenttype_code"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "group_code"
  end

  create_table "incidents", :force => true do |t|
    t.integer  "student_id"
    t.integer  "profile_id"
    t.datetime "incident_datetime"
    t.text     "observations"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "institutes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "address"
    t.integer  "aacce_id"
    t.string   "phone"
    t.string   "email"
    t.string   "web"
    t.string   "locality"
    t.string   "zip"
    t.string   "city"
    t.string   "province"
    t.string   "fax"
    t.string   "holder"
    t.string   "nature"
    t.string   "island"
    t.string   "institute_code"
    t.string   "type_center"
  end

  create_table "matters", :force => true do |t|
    t.string   "name"
    t.integer  "curso"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "trainercycle_id"
    t.string   "m_id"
  end

  create_table "objetive_averages", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "objetive_id"
    t.integer  "classroom_id"
  end

  create_table "objetives", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "o_id"
    t.integer  "trainercycle_id"
  end

  create_table "observations", :force => true do |t|
    t.integer  "student_id"
    t.integer  "profile_id"
    t.datetime "observation_datetime"
    t.text     "text"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "points", :force => true do |t|
    t.integer  "student_id"
    t.integer  "profile_id"
    t.integer  "num"
    t.datetime "point_datetime"
    t.text     "observations"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "profiles", :force => true do |t|
    t.integer  "institute_id"
    t.integer  "trainercycle_id"
    t.integer  "matter_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "teacher_id"
    t.integer  "group_id"
    t.boolean  "default"
  end

  add_index "profiles", ["institute_id"], :name => "index_profiles_on_institute_id"
  add_index "profiles", ["matter_id"], :name => "index_profiles_on_matter_id"
  add_index "profiles", ["trainercycle_id"], :name => "index_profiles_on_trainercycle_id"

  create_table "qualifyingentities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "profile_id"
    t.date     "date"
    t.integer  "quarter_id"
  end

  create_table "qualifyingentity_criterions", :force => true do |t|
    t.integer  "percentage"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "criterion_id"
    t.integer  "qualifyingentity_id"
    t.integer  "profile_id"
  end

  create_table "qualifyingentity_tlresults", :force => true do |t|
    t.integer  "qualifyingentity_id"
    t.integer  "tlresult_id"
    t.float    "percentage"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "profile_id"
  end

  create_table "quarters", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.date     "start_date"
    t.date     "end_date"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "schedules", :force => true do |t|
    t.string   "diasemana"
    t.string   "hora"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "classroom_id"
  end

  create_table "scores", :force => true do |t|
    t.float    "grade"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "qualifyingentity_tlresult_id"
    t.integer  "student_id"
    t.text     "observations"
  end

  create_table "students", :force => true do |t|
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "student_code"
    t.string   "firstsurname"
    t.string   "secondsurname"
    t.string   "name"
    t.string   "dni"
    t.string   "mail"
    t.string   "phone"
    t.string   "record"
    t.date     "birthdate"
    t.integer  "teacher_id"
  end

  create_table "teachers", :force => true do |t|
    t.string   "name"
    t.string   "surname"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "teacher_code"
    t.string   "dni"
    t.string   "phone"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "teachers", ["confirmation_token"], :name => "index_teachers_on_confirmation_token", :unique => true
  add_index "teachers", ["email"], :name => "index_teachers_on_email", :unique => true
  add_index "teachers", ["reset_password_token"], :name => "index_teachers_on_reset_password_token", :unique => true

  create_table "tlresult_percentages", :force => true do |t|
    t.integer  "quarter_1"
    t.integer  "quarter_2"
    t.integer  "quarter_3"
    t.integer  "global"
    t.integer  "profile_id"
    t.integer  "tlresult_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tlresults", :force => true do |t|
    t.text     "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "matter_id"
    t.string   "rayce_id"
    t.integer  "profile_id"
  end

  create_table "trainercycles", :force => true do |t|
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "trainercycletype_id"
    t.string   "cf_id"
    t.string   "cf_des"
    t.string   "cf_archivo"
    t.string   "title"
    t.string   "description"
    t.string   "family"
  end

  create_table "trainercycletypes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
