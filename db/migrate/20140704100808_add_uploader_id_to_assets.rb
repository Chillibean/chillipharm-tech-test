class AddUploaderIdToAssets < ActiveRecord::Migration[5.2]
  def change
    add_column :assets, :uploader_id, :integer

    add_index :assets, :uploader_id
  end
end
