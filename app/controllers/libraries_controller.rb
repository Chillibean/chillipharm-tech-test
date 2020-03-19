class LibrariesController < ApplicationController
  def show
    @assets = Asset.where(library_id: current_library.id)

    @saved_search = SavedSearch.find_by(id: params[:saved_search_id])

    if @saved_search.nil?
      set_scope_from_params
    else
      set_scope_from_saved_search
    end

    apply_scope
  end

  def index
    @libraries = Library.all
    render layout: 'library_dashboard'
  end

  def activity
    @activity = current_library.activities
    @activity = current_library.activities.order(created_at: :desc)
    if request.xhr?
      render partial: 'shared/activity_list', layout: false
    end
  end

  def info
    if request.xhr?
      render layout: false
    end
  end

  def set_scope_from_params
    # set search keyword
    @search = params[:search]
    @search = nil if @search.to_s.strip == ''

    # set filter select option
    @filter = params[:filter]
    @filter = nil unless ['video', 'audio', 'image'].include?(@filter)
    # !!! > it could be more file types than implemented in view:
    # !!! @filter = nil unless Asset.file_types.keys.include?(@filter)

    # set sorting
    @sort = params[:sort]

    if @sort || @filter || @search
      parameters = {keyword: @search, sort: @sort}
      parameters[:filter] = @filter if @filter
      @new_saved_search = SavedSearch.new(parameters)
    end
  end

  def set_scope_from_saved_search
    @search = @saved_search.keyword
    @filter = @saved_search.filter if ['video', 'audio', 'image'].include?(@saved_search.filter)
    @sort = @saved_search.sort
  end

  def apply_scope
    @assets = @assets.where('title ILIKE ?', "%#{@search}%") if @search
    @assets = @assets.where(file_type: @filter) if @filter

    case @sort
    when 'created_at_asc'
      @assets = @assets.order(:created_at)
    when 'created_at_desc'
      @assets = @assets.order(created_at: :desc)
    when 'title_asc'
      @assets = @assets.order(:title)
    when 'title_desc'
      @assets = @assets.order(title: :desc)
    end
  end

end
