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

ActiveRecord::Schema.define(version: 20161102064047) do

  create_table "ceremonies", force: :cascade do |t|
    t.string   "ceremonyName"
    t.string   "locationPreference"
    t.boolean  "agreementSigned",    default: false
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ceremony_notes", force: :cascade do |t|
    t.integer  "ceremonies_id"
    t.integer  "volunteer_id"
    t.string   "ceremonyNotes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ceremony_pictures", force: :cascade do |t|
    t.integer  "ceremonies_id"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ceremonyawards", force: :cascade do |t|
    t.integer  "ceremonies_id"
    t.string   "ceremonyAwardTitle"
    t.string   "ceremonyAwardInfo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "evaluation_reports", force: :cascade do |t|
    t.integer  "volunteer_id"
    t.integer  "organization_id"
    t.integer  "cleanUpsDone"
    t.integer  "cleanUpsRequired"
    t.datetime "date"
    t.datetime "evalPeriodStart"
    t.datetime "evalPeriodEnd"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "group_coordinators", force: :cascade do |t|
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "managementinfos", force: :cascade do |t|
    t.integer  "volunteer_id"
    t.integer  "organization_id"
    t.string   "coordinatorInfo"
    t.string   "coordinatorTitle"
    t.datetime "coordinatorStart"
    t.datetime "coordinatorEnd"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "managementinfos", ["organization_id"], name: "index_managementinfos_on_organization_id"
  add_index "managementinfos", ["volunteer_id"], name: "index_managementinfos_on_volunteer_id"

  create_table "organizations", force: :cascade do |t|
    t.string   "organizationName"
    t.string   "organizationStreet"
    t.string   "organizationCity"
    t.string   "organizationState"
    t.string   "organizationZip"
    t.string   "organizationPhone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parks", primary_key: "site_id", force: :cascade do |t|
    t.string   "parkType"
    t.string   "acres"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_volunteers", force: :cascade do |t|
  end

  create_table "projects", force: :cascade do |t|
    t.string   "projectName"
    t.string   "projectLocation"
    t.string   "yearlyParticipants"
    t.boolean  "ifCanceled",         default: false
    t.datetime "startDate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regular_members", force: :cascade do |t|
    t.decimal "reportedHours", precision: 6, scale: 2
  end

  create_table "reports", force: :cascade do |t|
    t.integer  "projects_id"
    t.string   "workDone"
    t.integer  "numVolunteers"
    t.integer  "totalHours"
    t.datetime "dateLastWork"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "short_term_events", force: :cascade do |t|
    t.integer  "organization_id"
    t.integer  "site_id"
    t.string   "type"
    t.string   "timeFrame"
    t.datetime "startDate"
    t.datetime "endDate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "signs", force: :cascade do |t|
    t.string   "milesNeeded"
    t.string   "signPlacement"
    t.string   "signLocation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "site_notes", force: :cascade do |t|
    t.integer  "site_id"
    t.integer  "volunteer_id"
    t.string   "siteNotes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites", force: :cascade do |t|
    t.string   "subtype"
    t.string   "siteStreet"
    t.string   "siteCrossStreets"
    t.string   "siteCounty"
    t.string   "siteZip"
    t.string   "status"
    t.string   "cityWardNumber"
    t.string   "countyDistrict"
    t.boolean  "permitRequired"
    t.boolean  "permitInPlace"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "streets", primary_key: "site_id", force: :cascade do |t|
    t.string   "start"
    t.string   "end"
    t.string   "direction"
    t.string   "miles"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tool_checkouts", force: :cascade do |t|
    t.integer  "organization_id"
    t.integer  "tool_id"
    t.integer  "volunteer_id"
    t.string   "Type"
    t.string   "Status"
    t.integer  "quantityRented"
    t.boolean  "approved"
    t.datetime "dateCheckedOut"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tool_notes", force: :cascade do |t|
    t.integer  "tool_id"
    t.integer  "volunteer_id"
    t.string   "toolNotes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tools", force: :cascade do |t|
    t.string   "toolName"
    t.string   "totalQuantity"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "volunteer_emails", force: :cascade do |t|
    t.integer  "volunteer_id"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "volunteers", force: :cascade do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.string   "emailSignIn"
    t.boolean  "admin",           default: false
    t.string   "title"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

  create_table "washes", primary_key: "site_id", force: :cascade do |t|
    t.string   "waterFlow"
    t.string   "Miles"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
