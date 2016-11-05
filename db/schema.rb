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

ActiveRecord::Schema.define(version: 20161103074056) do

  create_table "ceremonies", force: :cascade do |t|
    t.integer  "project_id",         limit: 4
    t.string   "ceremonyName",       limit: 255
    t.string   "locationPreference", limit: 255
    t.boolean  "agreementSigned",                default: false
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ceremony_pictures", force: :cascade do |t|
    t.integer  "ceremonies_id",     limit: 4
    t.string   "file_file_name",    limit: 255
    t.string   "file_content_type", limit: 255
    t.integer  "file_file_size",    limit: 4
    t.datetime "file_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ceremonyawards", force: :cascade do |t|
    t.integer  "ceremony_id",        limit: 4
    t.string   "ceremonyAwardTitle", limit: 255
    t.string   "ceremonyAwardInfo",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ceremonynotes", force: :cascade do |t|
    t.integer  "ceremony_id",   limit: 4
    t.integer  "volunteer_id",  limit: 4
    t.string   "ceremonyNotes", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "evaluation_reports", force: :cascade do |t|
    t.integer  "volunteer_id",     limit: 4
    t.integer  "organization_id",  limit: 4
    t.integer  "cleanUpsDone",     limit: 4
    t.integer  "cleanUpsRequired", limit: 4
    t.datetime "date"
    t.datetime "evalPeriodStart"
    t.datetime "evalPeriodEnd"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "group_coordinators", force: :cascade do |t|
    t.string   "address",    limit: 255
    t.string   "city",       limit: 255
    t.string   "state",      limit: 255
    t.string   "zipcode",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "managementinfos", force: :cascade do |t|
    t.integer  "volunteer_id",     limit: 4
    t.integer  "organization_id",  limit: 4
    t.string   "coordinatorInfo",  limit: 255
    t.string   "coordinatorTitle", limit: 255
    t.datetime "coordinatorStart"
    t.datetime "coordinatorEnd"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "managementinfos", ["organization_id"], name: "index_managementinfos_on_organization_id", using: :btree
  add_index "managementinfos", ["volunteer_id"], name: "index_managementinfos_on_volunteer_id", using: :btree

  create_table "organizations", force: :cascade do |t|
    t.string   "organizationName",   limit: 255
    t.string   "organizationStreet", limit: 255
    t.string   "organizationCity",   limit: 255
    t.string   "organizationState",  limit: 255
    t.string   "organizationZip",    limit: 255
    t.string   "organizationPhone",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parks", primary_key: "site_id", force: :cascade do |t|
    t.string   "parkType",   limit: 255
    t.string   "acres",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_volunteers", force: :cascade do |t|
  end

  create_table "projects", force: :cascade do |t|
    t.integer  "organization_id",    limit: 4
    t.integer  "site_id",            limit: 4
    t.string   "projectName",        limit: 255
    t.string   "projectLocation",    limit: 255
    t.string   "yearlyParticipants", limit: 255
    t.boolean  "ifCanceled",                     default: false
    t.datetime "startDate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regular_members", force: :cascade do |t|
    t.decimal "reportedHours", precision: 6, scale: 2
  end

  create_table "reports", force: :cascade do |t|
    t.integer  "project_id",    limit: 4
    t.string   "workDone",      limit: 255
    t.integer  "numVolunteers", limit: 4
    t.integer  "totalHours",    limit: 4
    t.datetime "dateLastWork"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "short_term_events", force: :cascade do |t|
    t.integer  "organization_id", limit: 4
    t.integer  "site_id",         limit: 4
    t.string   "type",            limit: 255
    t.string   "timeFrame",       limit: 255
    t.datetime "startDate"
    t.datetime "endDate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "signs", force: :cascade do |t|
    t.integer  "ceremony_id",   limit: 4
    t.string   "milesNeeded",   limit: 255
    t.string   "signPlacement", limit: 255
    t.string   "signLocation",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sitenotes", force: :cascade do |t|
    t.integer  "site_id",      limit: 4
    t.integer  "volunteer_id", limit: 4
    t.string   "siteNotes",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites", force: :cascade do |t|
    t.string   "subtype",          limit: 255
    t.string   "siteStreet",       limit: 255
    t.string   "siteCrossStreets", limit: 255
    t.string   "siteCounty",       limit: 255
    t.string   "siteZip",          limit: 255
    t.string   "status",           limit: 255
    t.string   "cityWardNumber",   limit: 255
    t.string   "countyDistrict",   limit: 255
    t.boolean  "permitRequired"
    t.boolean  "permitInPlace"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "streets", primary_key: "site_id", force: :cascade do |t|
    t.string   "start",      limit: 255
    t.string   "end",        limit: 255
    t.string   "direction",  limit: 255
    t.string   "miles",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tool_checkouts", force: :cascade do |t|
    t.integer  "organization_id", limit: 4
    t.integer  "tool_id",         limit: 4
    t.integer  "volunteer_id",    limit: 4
    t.string   "Type",            limit: 255
    t.string   "Status",          limit: 255
    t.integer  "quantityRented",  limit: 4
    t.boolean  "approved"
    t.datetime "dateCheckedOut"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "toolnotes", force: :cascade do |t|
    t.integer  "tool_id",      limit: 4
    t.integer  "volunteer_id", limit: 4
    t.string   "toolNotes",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tools", force: :cascade do |t|
    t.string   "toolName",      limit: 255
    t.string   "totalQuantity", limit: 255
    t.string   "description",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "volunteeremails", force: :cascade do |t|
    t.integer  "volunteer_id", limit: 4
    t.string   "email",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "volunteers", force: :cascade do |t|
    t.string   "firstName",       limit: 255
    t.string   "lastName",        limit: 255
    t.string   "emailSignIn",     limit: 255
    t.boolean  "admin",                       default: false
    t.string   "title",           limit: 255
    t.string   "phone",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest", limit: 255
  end

  create_table "washes", primary_key: "site_id", force: :cascade do |t|
    t.string   "waterFlow",  limit: 255
    t.string   "Miles",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "managementinfos", "organizations"
  add_foreign_key "managementinfos", "volunteers"
end
