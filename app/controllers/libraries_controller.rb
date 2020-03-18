class LibrariesController < ApplicationController
  def show
    @assets = Asset.where(library_id: current_library.id)

    # set search keyword
    @search = params[:search]
    @search = nil if @search.to_s.strip == ''
    @assets = @assets.where('title ILIKE ?', "%#{@search}%") if @search

    # set filter select option
    @filter = params[:filter]
    @filter = nil unless ['video', 'audio', 'image'].include?(@filter)
    # !!! > it could be more file types than implemented in view:
    # !!! @filter = nil unless Asset.file_types.keys.include?(@filter)
    @assets = @assets.where(file_type: @filter) if @filter

    # set sorting
    case params[:sort]
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
end
