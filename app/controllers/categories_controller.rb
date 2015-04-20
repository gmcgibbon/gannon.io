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
    else
      @categories = Category.all.order('title')
    end
  end

  def create
    @category = Category.new category_params

    if @category.save
      render json: @category.to_builder_json
    else
      render json: @category.to_builder_json, status: 422
    end
  end

  def update
    if @category.update_attributes category_params
      render json: @category.to_builder_json
    else
      render json: @category.to_builder_json, status: 422
    end
  end

  def destroy
    if @category.destroy
      render json: @category.to_builder_json
    else
      render json: @category.to_builder_json, status: 422
    end
  end

  def create_relation
    article = Article.find_by_slug(article_relation_params[:slug])

    if @category.articles << article
      render json: @category.to_builder_json
    else
      render json: @category.to_builder_json, status: 422
    end
  end

  def destroy_relation
    article = Article.find_by_slug(article_relation_params[:slug])

    if @category.articles.destroy(article)
      render json: @category.to_builder_json
    else
      render json: @category.to_builder_json, status: 422
    end
  end

  private

  def category_params
    params.require(:category).permit(:title, :slug)
  end

  def article_relation_params
    params.require(:article).permit(:slug)
  end

end
