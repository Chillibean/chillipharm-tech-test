module Account::LibrariesHelper
  def current_filter_label(filter)
    case filter
    when "video"
      "Video Only"
    when "audio"
      "Audio Only"
    when "image"
      "Image Only"
    else
      "All File Types"
    end
  end

  def current_sort_label(sort)
    case sort
    when "created_at_asc"
      "Oldest"
    when "created_at_desc"
      "Most Recent"
    when "title_asc"
      "Title A-Z"
    when "title_desc"
      "Title Z-A"
    else
      "Most Recent"
    end
  end

  def filter_link(filter, sort, search, section, library, object=nil)
    args = {}
    args[:filter] = filter

    if sort.present?
      args[:sort] = sort
    end

    if search.present?
      args[:search] = search
    end

    section_link(library, section, args, object)
  end

  def sort_link(sort, filter, search, section, library, object=nil)
    args = {}
    args[:sort] = sort

    if filter.present?
      args[:filter] = filter
    end

    if search.present?
      args[:search] = search
    end

    section_link(library, section, args, object)
  end

  def section_link(library, section, args, object=nil)
    case section
    when "library"
      library_path(library, args)
    when "collection"
      library_collection_path(library, object, args)
    else
      library_path(library, args)
    end
  end
end
