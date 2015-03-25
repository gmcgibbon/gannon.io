class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # RailsAdmin authorization failure rescue
  rescue_from CanCan::AccessDenied, with: :rescue_access_denied

  # Application root
  def root
    redirect_to controller: :articles, action: :index
  end

  # 404 not found
  def not_found
    respond_to do |f|
      f.html do
        render '/errors/404', status: 404
      end
      f.json do
        render '/errors/404.json', layout: false, status: 404
      end
    end
  end

  # 500 internal server error
  def internal_server_error
    respond_to do |f|
      f.html do
        render '/errors/500', status: 500
      end
      f.json do
        render '/errors/500.json', layout: false, status: 500
      end
    end
  end

  private

  # Access denied error handler
  def rescue_access_denied(error)
    if main_app.nil?
      flash[:error] = error.message
      redirect_to root_path
    else
      flash[:error] = error.message
      redirect_to main_app.root_path
    end
  end
end
