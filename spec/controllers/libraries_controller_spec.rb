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

        expect(assigns[:assets].collect{|a| a.id }).to eql(@library.assets.order(created_at: :desc).collect{|a| a.id})
      end
    end

    context "with search" do
      it "assigns all @assets for shared keyword" do
        assets = create_list(:asset, 5, library: @library, uploader: @user)

        get :show, params: { id: @library.id, search: 'set#' }

        expect(assigns[:assets].collect{|a| a.id }).to eql(@library.assets.order(created_at: :desc).collect{|a| a.id})
      end

      it "assigns all @assets for shared keyword with wrong case" do
        assets = create_list(:asset, 5, library: @library, uploader: @user)

        get :show, params: { id: @library.id, search: 'sET#' }

        expect(assigns[:assets].collect{|a| a.id }).to eql(@library.assets.order(created_at: :desc).collect{|a| a.id})
      end

      it "@assets are empty for wrong keyword" do
        assets = create_list(:asset, 5, library: @library, uploader: @user)

        get :show, params: { id: @library.id, search: 'sEEE#' }

        expect(assigns[:assets].collect{|a| a.id }).to eql([])
      end

      it "@assets contains proper element" do
        assets = create_list(:asset, 5, library: @library, uploader: @user)
        asset_to_select = assets.last

        get :show, params: { id: @library.id, search: asset_to_select.title[3..-1] }

        expect(assigns[:assets].collect{|a| a.id }).to eql([asset_to_select.id])
      end

      it "@assets contains proper element even with wrong case" do
        assets = create_list(:asset, 5, library: @library, uploader: @user)
        asset_to_select = assets.last

        get :show, params: { id: @library.id, search: asset_to_select.title[3..-1].upcase }

        expect(assigns[:assets].collect{|a| a.id }).to eql([asset_to_select.id])
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
