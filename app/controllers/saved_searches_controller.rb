class SavedSearchesController < ApplicationController

  before_action :set_library, only: [:create]
  before_action :set_search, only: [:destroy]

  def create
    @search = @library.saved_searches.new search_params
    if @search.save
      redirect_to library_url(@library), notice: 'Search saved'
    else
      redirect_to library_url(@library), alert: "Errors: #{@search.errors.full_messages.join('; ')}"
    end
  end

  def destroy
    @search.destroy
    redirect_to library_url(@search.library_id), notice: 'Search deleted'
  end

  private

  def set_search
    # 'soft' warning since user can delete request
    # but then use link from page generated befole deletion
    @search = SavedSearch.find_by(id: params[:id])
    redirect_to root_url, alert: 'SavedSearch not found' if @search.nil?
  end

  def search_params
    p = params.require(:saved_search).permit(:name, :keyword, :sort, :filter)
    p.delete(:sort) unless SavedSearch.sorts.keys.include?(p[:sort])
    p.delete(:filter) unless SavedSearch.filters.keys.include?(p[:filter])
    p
  end

  def set_library
    @library = Library.find(params[:library_id])
  end

end
