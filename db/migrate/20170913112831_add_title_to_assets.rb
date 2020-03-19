class AddTitleToAssets < ActiveRecord::Migration[5.2]
  def change
    add_column :assets, :title, :string
  end
end
