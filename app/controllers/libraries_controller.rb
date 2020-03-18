class LibrariesController < ApplicationController
  def show
    @search = params[:search]
    @search = nil if @search.to_s.strip == ''

    @assets = Asset.where(library_id: current_library.id)

    @assets = @assets.where('title ILIKE ?', "%#{@search}%") if @search
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
