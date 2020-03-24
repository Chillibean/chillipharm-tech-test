require 'rails_helper'

RSpec.describe LibrariesController, :type => :controller do
  before :each do
    @user = create(:user)
    log_in_user(@user)
  end

  describe "GET show" do
    before :each do
      @library = create(:library)
    end

    context "without search, filter or sorting parameters" do
      it "assigns @assets" do
        assets = create_list(:asset, 5, library: @library, uploader: @user)

        get :show, params: { id: @library.id }

        expect(assigns[:assets].collect{|a| a.id}).to eql(@library.assets.order(created_at: :desc).collect{|a| a.id})
      end
    end

    context "with search" do
      let!(:asset_1) { create(:asset, library: @library, uploader: @user, title: 'good') }
      let!(:asset_2) { create(:asset, library: @library, uploader: @user, title: 'bad') }
      let!(:asset_3) { create(:asset, library: @library, uploader: @user, title: 'very bad') }

      it "assigns @assets" do
        get :show, params: { id: @library.id, search: 'good' }

        expect(assigns[:assets]).to eq([asset_1])
      end

      it "assigns @assets matching part of the title" do
        get :show, params: { id: @library.id, search: 'od' }

        expect(assigns[:assets]).to eq([asset_1])
      end

      it "assigns @assets matching part of the title case insensitive" do
        get :show, params: { id: @library.id, search: 'Goo' }

        expect(assigns[:assets]).to eq([asset_1])
      end
    end

    it "renders the 'show' template" do
      get :show, params: { id: @library.id }
      expect(response).to render_template(:show)
    end

    it "returns a 200 OK status" do
      get :show, params: { id: @library.id }
      expect(response).to be_ok
    end
  end
end
