class AddCommentCounterCacheToAssets < ActiveRecord::Migration[5.2]
  def change
    add_column :assets, :comments_count, :integer
  end
end
