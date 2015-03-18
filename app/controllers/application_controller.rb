class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # RailsAdmin authorization failure rescue
  rescue_from CanCan::AccessDenied, with: :rescue_access_denied

  # Application root
  def root
    @articles = Article.limit(3)
  end

  # 404 not found
  def not_found
    respond_to do |f|
      f.html { render template: '/errors/404', status: 404 }
      f.json do
        render json: { error: 'not found!' }.to_json, status: 404
      end
    end
  end

  # 422 unprocessible entity
  def unprocessible_entity
    respond_to do |f|
      f.html { render template: '/errors/422', status: 422 }
      f.json do
        render json: { error: 'unprocessible entity!' }.to_json, status: 422
      end
    end
  end

  # 500 internal server error
  def internal_server_error
    respond_to do |f|
      f.html { render template: '/errors/500', status: 500 }
      f.json do
        render json: { error: 'internal server error!' }.to_json, status: 500
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
