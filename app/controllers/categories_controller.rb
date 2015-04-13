class CategoriesController < ApplicationController

  include SlugResourceAuthorizable

  respond_to :html, only: [:show]
  respond_to :json, only: [:create]

  def show
    @articles = @category
      .articles
      .paginate(page: params[:page], per_page: 10)
      .order('updated_at DESC')

    if request.xhr?
      render partial: 'articles/paginated'
    end
  end

  def create
    @article      = Article.new article_params
    @article.user = current_user

    if @article.save
      flash[:success] = I18n.t('gannon.record.create.success', record: Article.name)
      redirect_to @article
    else
      flash.now[:fail] = I18n.t('gannon.record.create.fail', record: Article.name)
      render :new, status: 422
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :slug)
  end

end
