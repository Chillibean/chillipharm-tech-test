class AddCreatorToLibrary < ActiveRecord::Migration[5.2]
  def change
    add_column :libraries, :creator_id, :integer
  end
end
