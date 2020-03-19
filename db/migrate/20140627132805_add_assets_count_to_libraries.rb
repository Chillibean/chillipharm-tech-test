class AddAssetsCountToLibraries < ActiveRecord::Migration[5.2]
  def change
    add_column :libraries, :assets_count, :integer, default: 0
  end
end
