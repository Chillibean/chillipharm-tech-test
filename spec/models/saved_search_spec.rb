require 'rails_helper'

RSpec.describe SavedSearch, type: :model do
  it "has a valid factory" do
    expect(build(:saved_search)).to be_valid
  end

  it "is invalid without a Name" do
    search = build(:saved_search, name: '')
    expect(search.valid?).to be_falsey
    expect(search.errors[:name]).to include("can't be blank")
  end

  it "is invalid without library" do
    search = build(:saved_search)

    expect(search.update(library_id: nil)).to be_falsey
    expect(search.errors[:library]).to include("can't be blank")
  end

end
