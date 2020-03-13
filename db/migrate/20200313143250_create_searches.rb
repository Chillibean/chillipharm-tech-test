class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.string :assets_ids

      t.timestamps
    end
  end
end
