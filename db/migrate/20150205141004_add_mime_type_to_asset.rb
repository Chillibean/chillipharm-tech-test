class AddMimeTypeToAsset < ActiveRecord::Migration[5.2]
  def change
    add_column :assets, :mime_type, :string
  end
end
