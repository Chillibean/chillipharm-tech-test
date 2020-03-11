require 'rails_helper'

RSpec.describe AssetsController, :type => :controller do
  before :each do
    @user = create(:user)
    @library = create(:library)
    @video_asset = create(:asset, title: "asset test", library: @library, uploader: @user, file_type: :video)
    log_in_user(@user)
  end

  describe "PUT update" do
    context "the user has permission to manage assets" do
      before do
        user = create(:user)
        log_in_user(user)
      end

      it "updates the asset" do
        put :update, params: { library_id: @library.id, id: @video_asset.id, asset: { title: "new title" } }
        expect(@video_asset.reload.title).to eq("new title")
      end
    end
  end
end
