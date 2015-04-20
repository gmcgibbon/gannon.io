class CategoriesController < ApplicationController

  include SlugResourceAuthorizable

  respond_to :html, only: [:show]
  respond_to :json, only: [:create]

  def show
    if request.xhr?
      render partial: 'articles/paginated'
    else
      @categories = Category.all.order('title')
    end
    @articles = @category
      .articles
      .paginate(page: params[:page], per_page: 10)
      .order('updated_at DESC')
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

  end

  def destroy_relation

  end

  private

  def category_params
    params.require(:category).permit(:title, :slug)
  end

end
