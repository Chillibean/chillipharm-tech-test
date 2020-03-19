class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :saved_searches do |t|
      t.references :library, foreign_key: true
      t.string :name, null: false, default: ''
      t.string :keyword, null: false, default: ''
      t.integer :sort, null: false, default: 0
      t.integer :filter, null: false, default: 0

      t.timestamps
    end
  end
end
