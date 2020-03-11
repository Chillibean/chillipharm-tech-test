class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception unless Rails.env.test?

  helper_method :current_user
  def current_user
    User.first
  end

  helper_method :current_library
  def current_library
    if params[:library_id]
      @current_library ||= Library.find(params[:library_id])
    elsif params[:id] && controller_name.eql?("libraries")
      @current_library ||= Library.find(params[:id])
    end
  end
end
