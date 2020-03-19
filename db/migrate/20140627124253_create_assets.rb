class CreateAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :assets do |t|
      t.string :filename
      t.integer :filesize, limit: 8
      t.string :file_id
      t.integer :file_type, default: 0
      t.references :library, index: true
      t.string   :s3_name
      t.string   :s3_url
      t.string   :s3_region
      t.string   :s3_thumbnail_path
      t.integer  "account_id"
      t.json     "media_info",                default: {}, null: false
      t.json     "exif_data",                 default: {}, null: false
      t.string   "thumbnail_file_id"
      t.string   "checksum"
      t.string   "legacy_id"
      t.string   "legacy_filehash"
      t.string   "legacy_thumbnail_filehash"

      t.timestamps
    end
  end
end
