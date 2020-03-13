class LibrariesController < ApplicationController
  def show
    # Pre-conditioning the passed params, so that they fit the ActiveRecord where and order naming conventions
    sort_params = decypher_params_sort(params[:sort]) unless params[:sort].nil?
    filter_params = decypher_params_filter(params[:filter]) unless params[:filter].nil?
    # Joining multiple ActiveRecord statements for more efficient database query
    if params[:sort].nil? && params[:filter].nil?
      @assets = Asset.where(library_id: current_library.id)
                     .where("title ILIKE ?", "%#{search(params[:search])}%")

    elsif params[:filter].nil?
      @assets = Asset.where(library_id: current_library.id)
               .where("title ILIKE ?", "%#{search(params[:search])}%")
               .order("#{sort_params}")

    elsif params[:sort].nil?
      @assets = Asset.where(library_id: current_library.id)
               .where("title ILIKE ?", "%#{search(params[:search])}%")
               .where(file_type: filter_params)
    else
      @assets = Asset.where(library_id: current_library.id)
               .where("title ILIKE ?", "%#{search(params[:search])}%")
               .where(file_type: filter_params)
               .order("#{sort_params}")
    end
      @assets_ids = @assets.map { |asset| asset.id }.join(",")
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

  private

  def search(search_params)
    if search_params.nil?
      ""
    else
      search_params
    end
  end

  def decypher_params_sort(user_sort_choice)
    if user_sort_choice == "created_at_asc"
      "created_at"
    elsif user_sort_choice == "created_at_desc"
      "created_at desc"
    elsif user_sort_choice == "title_asc"
      "title"
    elsif user_sort_choice == "created_at_desc"
      "title desc"
    end
  end

  def decypher_params_filter(user_filter_choice)
    # Not scalable if we add another filetype, but can't find what is a valid wildcard for all
    if user_filter_choice == "all"
      ["video", "audio", "image", "document", "unknown"]
    else
      user_filter_choice
    end
  end
end
