class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string   "name"
      t.string   "email"
      t.string   "password_digest"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.boolean  "chillibean_staff"
      t.boolean  "activated",              default: false
      t.string   "avatar_file_id"
      t.string   "company"
      t.string   "job_title"
      t.string   "phone"
      t.string   "cropped_avatar_file_id"
      t.boolean  "suspended",              default: false
      t.boolean  "force_password_change",  default: false
      t.date     "activation_date"
      t.date     "password_reset_date"
      t.string   "last_password_digest"
      t.string   "legacy_id"

      t.timestamps
    end
  end
end
