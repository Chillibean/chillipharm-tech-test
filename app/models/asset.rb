class Asset < ApplicationRecord
  acts_as_paranoid column: :soft_deleted_at

  belongs_to :library, counter_cache: true
  belongs_to :uploader, class_name: "User"
  has_many :comments, -> { includes(:author) }

  enum file_type: [:video, :image, :audio, :document, :unknown]

  validates :filename, presence: true
  validates :library, presence: true
  validates :uploader, presence: true
end
