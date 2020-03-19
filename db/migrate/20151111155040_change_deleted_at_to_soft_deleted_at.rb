class ChangeDeletedAtToSoftDeletedAt < ActiveRecord::Migration[5.2]
  def change
    rename_column :assets, :deleted_at, :soft_deleted_at
  end
end
