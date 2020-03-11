require 'rails_helper'

RSpec.describe User, :type => :model do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  it "is valid without a name" do
    user = build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to_not include("can't be blank")
  end

  it "is invalid without an email"do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid with a duplicate email" do
    create(:user, email: "test@example.com")
    user = build(:user, email: "test@example.com")
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

  it "downcases the users email" do
    user = build(:user, email: "TEST@EXAMPLE.COM")
    user.valid?
    expect(user.email).to eq("test@example.com")
  end

  describe "returns a user's name as a string" do
    context "when they have not set a name" do
      it "returns their email address" do
        user = build(:user, name: nil)
        expect(user.fullname).to eq(user.email)
      end
    end

    context "when they have set a name" do
      it "returns their name" do
        user = build(:user)
        expect(user.fullname).to eq(user.name)
      end
    end
  end
end
