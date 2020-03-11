class Library < ApplicationRecord
  acts_as_paranoid

  has_many :assets
  belongs_to :creator, class_name: "User"

  validates :name, presence: true

  def self.alphabetical
    order("name ASC")
  end
end
