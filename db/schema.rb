# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_22_110505) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "cin"
    t.string "phone"
    t.string "website"
    t.string "Email_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "designation"
    t.string "department"
    t.string "PAN"
    t.string "PF"
    t.string "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "company_id", null: false
    t.index ["company_id"], name: "index_employees_on_company_id"
  end

  create_table "employeesalaries", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.bigint "salary_id", null: false
    t.datetime "formonth"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["employee_id"], name: "index_employeesalaries_on_employee_id"
    t.index ["salary_id"], name: "index_employeesalaries_on_salary_id"
  end

  create_table "payroll1s", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payroll_imports", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "file"
  end

  create_table "salaries", force: :cascade do |t|
    t.text "salary_details"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "employees", "companies"
  add_foreign_key "employeesalaries", "employees"
  add_foreign_key "employeesalaries", "salaries"
end
