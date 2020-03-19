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

ActiveRecord::Schema.define(version: 2020_03_18_185826) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "action"
    t.integer "user_id"
    t.string "user_email"
    t.integer "activity_object_id"
    t.string "object_text"
    t.string "object_url"
    t.integer "secondary_object_id"
    t.string "secondary_object_url"
    t.string "secondary_object_class"
    t.string "secondary_object_method"
    t.string "secondary_object_text"
    t.string "type"
    t.integer "library_id"
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ip"
    t.string "browser"
    t.datetime "deleted_at"
    t.string "location"
  end

  create_table "assets", force: :cascade do |t|
    t.string "filename"
    t.bigint "filesize"
    t.string "file_id"
    t.integer "file_type", default: 0
    t.bigint "library_id"
    t.string "s3_name"
    t.string "s3_url"
    t.string "s3_region"
    t.string "s3_thumbnail_path"
    t.integer "account_id"
    t.json "media_info", default: {}, null: false
    t.json "exif_data", default: {}, null: false
    t.string "thumbnail_file_id"
    t.string "checksum"
    t.string "legacy_id"
    t.string "legacy_filehash"
    t.string "legacy_thumbnail_filehash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "uploader_id"
    t.integer "comments_count", default: 0
    t.datetime "soft_deleted_at"
    t.string "mime_type"
    t.string "title"
    t.index ["library_id"], name: "index_assets_on_library_id"
    t.index ["soft_deleted_at"], name: "index_assets_on_soft_deleted_at"
    t.index ["uploader_id"], name: "index_assets_on_uploader_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "comment"
    t.bigint "asset_id"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["asset_id"], name: "index_comments_on_asset_id"
    t.index ["author_id"], name: "index_comments_on_author_id"
  end

  create_table "libraries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "assets_count", default: 0
    t.integer "creator_id"
    t.time "deleted_at"
  end

  create_table "saved_searches", force: :cascade do |t|
    t.bigint "library_id"
    t.string "name", default: "", null: false
    t.string "keyword", default: "", null: false
    t.integer "sort", default: 0, null: false
    t.integer "filter", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["library_id"], name: "index_saved_searches_on_library_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "chillibean_staff"
    t.boolean "activated", default: false
    t.string "avatar_file_id"
    t.string "company"
    t.string "job_title"
    t.string "phone"
    t.string "cropped_avatar_file_id"
    t.boolean "suspended", default: false
    t.boolean "force_password_change", default: false
    t.date "activation_date"
    t.date "password_reset_date"
    t.string "last_password_digest"
    t.string "legacy_id"
    t.string "token"
    t.string "timezone"
    t.datetime "deleted_at"
  end

  add_foreign_key "saved_searches", "libraries"
end
