class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # RailsAdmin authorization failure rescue
  rescue_from CanCan::AccessDenied, with: :rescue_access_denied

  before_filter :init_view_defaults

  helper :view

  # Website map
  def sitemap
    respond_to do |f|
      f.html { render }
      f.xml  { render layout: false }
    end
  end

  # 404 not found
  def not_found
    respond_to do |f|
      f.html { render '/errors/404', status: 404 }
      f.json { render '/errors/404.json', layout: false, status: 404 }
    end
  end

  # 500 internal server error
  def internal_server_error
    respond_to do |f|
      f.html { render '/errors/500', status: 500 }
      f.json { render '/errors/500.json', layout: false, status: 500 }
    end
  end

  protected

  # Initializes default view strings
  def init_view_defaults
    action     = action_name.capitalize
    controller = controller_name.capitalize.singularize

    @app_title  ||= Rails.application.class.parent_name
    @page_title ||= "#{action} #{controller}"
  end

  private

  # Access denied error handler
  def rescue_access_denied(error)
    if main_app.nil?
      flash[:fail] = error.message
      redirect_to root_path
    else
      flash[:fail] = error.message
      redirect_to main_app.root_path
    end
  end
end
