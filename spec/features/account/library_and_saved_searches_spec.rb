require 'rails_helper'

RSpec.feature 'Library and SavedSearches' do
  before :each do
    @user = create(:user)
    @library = create(:library)
    @video_asset = create(:asset, library: @library, uploader: @user, file_type: :video, created_at: 5.weeks.ago, filename: "video.mp4", title: "the video")
    @image_asset = create(:asset, library: @library, uploader: @user, file_type: :image, created_at: 3.weeks.ago, filename: "image.jpg", title: "the image")
    @document_asset = create(:asset, library: @library, uploader: @user, file_type: :document, created_at: 2.weeks.ago, filename: "document.pdf", title: "the doc")
    @audio_asset = create(:asset, library: @library, uploader: @user, file_type: :audio, created_at: 1.week.ago, filename: "audio.mp3", title: "the audio")
  end

  scenario 'Search/filter/sort params trigger theform to save' do
    sign_in_as(@user)

    visit library_path(@library)
    # nothing to save - no form
    page.has_no_field?('#new_saved_search_form')

    page.fill_in 'search', with: 'video'
    page.click_button("Search")

    expect(page.current_url).to start_with(library_url(@library))
    expect(page.current_url).to include('search=video')
    # there is a form here now
    page.has_field?('#new_saved_search_form')
  end

  scenario 'Create Saved search' do
    sign_in_as(@user)

    visit library_path(@library)

    page.fill_in 'search', with: 'video'
    page.click_button("Search")

    page.find('a', text: 'All File Types', match: :first).click
    page.find('a', text: 'Video Only').click

    page.find('a', text: 'Most Recent', match: :first).click
    page.find('a', text: 'Title A-Z').click

    # save search
    page.fill_in 'saved_search_name', with: 'keyword: video'
    page.click_button("Save search")

    # find search ath the page
    expect(page.current_url).to eq(library_url(@library))
    page.find('a', text: 'keyword: video')

    # all search parameters saved properly
    search = @library.saved_searches.order(:id).last
    expect(search.name).to eq('keyword: video')
    expect(search.keyword).to eq('video')
    expect(search.filter).to eq('video')
    expect(search.sort).to eq('title_asc')

    # apply saved search
    page.find('a', text: 'keyword: video').click
    expect(page.current_url).to start_with(library_url(@library))
    expect(page.current_url).to include("saved_search_id=#{@library.saved_searches.order(:id).last.id}")

    all_assets = page.all(".asset")
    expect(all_assets.length).to eq(1)
    expect(all_assets[0]["id"]).to eql("asset-#{@video_asset.id}")

    page.find('a', text: 'Video Only', match: :first)
    page.find('a', text: 'Title A-Z', match: :first)
    # indicator of saved search results shown
    page.find('h2', text: 'Saved: keyword: video')
  end

end
