class CategoriesController < ApplicationController

  include SlugResourceAuthorizable

  def show
    @articles = @category
      .articles
      .paginate(page: params[:page], per_page: 10)
      .order('updated_at DESC')

    if request.xhr?
      render partial: 'articles/paginated'
    end
  end

end
