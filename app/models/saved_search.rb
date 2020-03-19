class SavedSearch < ApplicationRecord

  belongs_to :library

  enum filter: {
    any: 0,
    video: 1,
    image: 2,
    audio: 3,
    document: 4,
    unknown: 5
  }

  enum sort: {
    created_at_asc: 0,
    created_at_desc: 1,
    title_asc: 2,
    title_desc: 3
  }

  validates :name, presence: true
  validates :library, presence: true
end
