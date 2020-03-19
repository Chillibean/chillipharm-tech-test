require 'rails_helper'


RSpec.describe SavedSearchesController, :type => :controller do

  before :each do
    @user = create(:user)
    log_in_user(@user)
    @library = create(:library)
  end

  describe "destroy" do
    before :each do
      @search = create(:saved_search, library_id: @library.id)
    end

    it 'destroys saved_search' do
      expect do
        delete :destroy, params: { id: @search.id }
      end.to change{@library.saved_searches.count}.from(1).to(0)
      expect(response).to redirect_to(library_url(@library))
    end

    it 'no error for wrong saved_search id' do
      expect do
        delete :destroy, params: { id: (@search.id + 1000) }
      end.to_not change{@library.saved_searches.count}

      expect(response).to redirect_to(root_url)
      expect(flash[:alert]).to eq('SavedSearch not found')
    end

  end

  describe "create" do

    it 'creates valid saved_search' do
      parameters = {
        name: 'New saved search name',
        filter: 'video',
        sort: 'title_asc',
        keyword: 'the key'
      }
      expect do
        post :create, params: {
          library_id: @library.id,
          saved_search: parameters
      }
      end.to change{@library.saved_searches.count}.from(0).to(1)
      expect(response).to redirect_to(library_url(@library))
      expect(flash[:notice]).to eq('Search saved')
      search = SavedSearch.last
      parameters.each do |key, val|
        expect(search.send(key)).to eq(val)
      end
    end

    it 'shows errros for not valid saved_search' do
      expect do
        post :create, params: { library_id: @library.id, saved_search: {name: '', filter: 'video', sort: 'title_asc', search: 'the key'} }
      end.to_not change{@library.saved_searches.count}
      expect(response).to redirect_to(library_url(@library))
      expect(flash[:alert]).to eq("Errors: Name can't be blank")
    end
  end

end
