module Account::ActivityHelper
  def asset_text(activity)
    if Asset.exists? activity.activity_object_id
      asset = Asset.with_deleted.find activity.activity_object_id

      if asset.deleted?
        asset.title
      else
        link_to asset.title, library_asset_url(activity.library_id, asset)
      end
    else
      activity.object_text
    end
  end

  def secondary_object_text(activity)
    klass = activity.secondary_object_class.classify.constantize
    if klass.exists? activity.secondary_object_id
      secondary_object = klass.find activity.secondary_object_id

      if activity.secondary_object_url
        link_to secondary_object.send(activity.secondary_object_method), activity.secondary_object_url
      else
        secondary_object.send(activity.secondary_object_method)
      end
    else
      activity.secondary_object_text
    end
  end

  def activity_creator_text(activity)
    if activity.user_id.eql? current_user.id
      link_to "You", user_path(activity.user_id), class: "fancybox user-profile", "data-fancybox-type" => "ajax"
    else
      link_to activity.user_email, user_path(activity.user_id), class: "fancybox user-profile", "data-fancybox-type" => "ajax"
    end
  end

  def info_field_changes(activity)
    ""
  end
end