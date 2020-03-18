class AssetActivity < ApplicationRecord

  self.table_name  = 'activities'

  belongs_to :user
  belongs_to :library

end
