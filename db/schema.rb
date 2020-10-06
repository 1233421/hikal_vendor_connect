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

ActiveRecord::Schema.define(version: 2020_10_05_120427) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "bank_details", force: :cascade do |t|
    t.string "account_number"
    t.string "account_type"
    t.string "bank_name"
    t.string "bank_code"
    t.string "branch_name"
    t.string "bank_address"
    t.string "ifsc_code"
    t.string "canceled_cheque"
    t.bigint "vendor_application_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vendor_application_id"], name: "index_bank_details_on_vendor_application_id"
  end

  create_table "company_informations", force: :cascade do |t|
    t.integer "company_presentation"
    t.string "company_presentation_doc"
    t.integer "credit_rating"
    t.string "credit_rating_doc"
    t.integer "product_catelogue"
    t.string "product_catelogue_doc"
    t.integer "manufactoring_facilities"
    t.string "manufactoring_facilities_doc"
    t.integer "quality_assurance_plan"
    t.string "quality_assurance_plan_doc"
    t.integer "iso_9001"
    t.string "iso_9001_doc"
    t.integer "iso_14000"
    t.string "iso_14000_doc"
    t.integer "iso_27000"
    t.string "iso_27000_doc"
    t.integer "ohsas"
    t.string "ohsas_doc"
    t.integer "indian_boiler_regulations"
    t.string "indian_boiler_regulations_doc"
    t.integer "asme"
    t.string "asme_doc"
    t.integer "pressure_equipment_directive"
    t.string "pressure_equipment_directive_doc"
    t.integer "underwriters_labs"
    t.string "underwriters_labs_doc"
    t.integer "customer_approval"
    t.string "customer_approval_doc"
    t.integer "sample_test"
    t.string "sample_test_doc"
    t.integer "customer_reference"
    t.string "customer_reference_doc"
    t.integer "incorporation_certificate"
    t.string "incorporation_certificate_doc"
    t.integer "legal_cases"
    t.string "legal_cases_doc"
    t.integer "annual_turnover"
    t.string "annual_turnover_doc"
    t.bigint "vendor_application_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vendor_application_id"], name: "index_company_informations_on_vendor_application_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "entities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "general_informations", force: :cascade do |t|
    t.integer "vendor_type"
    t.integer "vendor_sub_type"
    t.integer "nature_of_the_entity"
    t.integer "annual_sales"
    t.string "list_of_products"
    t.string "correspondence_address_line_1"
    t.string "correspondence_address_line_2"
    t.string "correspondence_city"
    t.string "correspondence_state"
    t.string "correspondence_country"
    t.string "correspondence_pin_code"
    t.string "shipping_address_line_1"
    t.string "shipping_address_line_2"
    t.string "shipping_city"
    t.string "shipping_state"
    t.string "shipping_country"
    t.string "shipping_pin_code"
    t.string "office_address_line_1"
    t.string "office_address_line_2"
    t.string "office_city"
    t.string "office_state"
    t.string "office_country"
    t.string "office_pin_code"
    t.bigint "vendor_application_id"
    t.index ["vendor_application_id"], name: "index_general_informations_on_vendor_application_id"
  end

  create_table "gst_infos", force: :cascade do |t|
    t.string "pan_card"
    t.string "pan_card_doc"
    t.integer "is_organization_registered"
    t.integer "is_gst_exempted"
    t.integer "is_turonover_below_par"
    t.bigint "vendor_application_id", null: false
    t.string "state"
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "gst_no"
    t.string "pin_code"
    t.string "registered_email"
    t.string "gst_certificate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vendor_application_id"], name: "index_gst_infos_on_vendor_application_id"
  end

  create_table "management_informations", force: :cascade do |t|
    t.integer "key_contact"
    t.string "name"
    t.string "designation"
    t.string "landline"
    t.string "mobile"
    t.string "email"
    t.string "pan_card"
    t.string "aadar_card"
    t.bigint "vendor_application_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vendor_application_id"], name: "index_management_informations_on_vendor_application_id"
  end

  create_table "statutory_details", force: :cascade do |t|
    t.string "service_tax_no"
    t.string "service_tax_no_doc"
    t.string "esic_no"
    t.string "esic_no_doc"
    t.string "vat_tin_no"
    t.string "vat_tin_no_doc"
    t.string "cst_tin_no"
    t.string "cst_tin_no_doc"
    t.string "pf_no"
    t.string "pf_no_doc"
    t.string "labour_license_no"
    t.string "labour_license_no_doc"
    t.integer "is_covered_under_msme"
    t.date "msme_registered_date"
    t.string "msme_type"
    t.string "ca_certificate"
    t.bigint "vendor_application_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vendor_application_id"], name: "index_statutory_details_on_vendor_application_id"
  end

  create_table "sub_vendor_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.integer "employee_number"
    t.integer "department"
    t.integer "division"
    t.string "employee_position"
    t.integer "role"
    t.string "vendor_name"
    t.string "site_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vendor_applications", force: :cascade do |t|
    t.bigint "user_id"
    t.string "current_step"
    t.boolean "is_submitted_for_approval"
    t.boolean "is_approved_by_first_level"
    t.boolean "is_approved_by_second_level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_vendor_applications_on_user_id"
  end

  create_table "vendor_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bank_details", "vendor_applications"
  add_foreign_key "company_informations", "vendor_applications"
  add_foreign_key "gst_infos", "vendor_applications"
  add_foreign_key "management_informations", "vendor_applications"
  add_foreign_key "statutory_details", "vendor_applications"
end
