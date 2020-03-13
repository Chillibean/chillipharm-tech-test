class Activity < ApplicationRecord
  belongs_to :library
  belongs_to :creator, class_name: "User"

  validates :library, presence: true
  validates :creator, presence: true
end
