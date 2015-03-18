class ArticlesController < ApplicationController

  load_and_authorize_resource find_by: :slug,
                              id_param: :slug

  def index
    @articles = Article.limit(10)
  end

  def create
    @article = Article.new article_params

    if @article.save
      flash[:success] = "Article was successfully created!"
      render :root
    else
      flash[:error] = "Article could not be created!"
      render :new, status: 422
    end
  end

  def edit; end

  def show; end

  def update
    if @article.update_attributes article_params
      flash[:success] = "Article was successfully updated!"
      render :root
    else
      flash[:error] = "Article could not be updated!"
      render :edit, status: 422
    end
  end

  def destroy
    if @article.destroy
      flash[:success] = "Article was successfully deleted!"
      render :root
    else
      flash[:error] = "Article could not be deleted!"
      render :edit, status: 422
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :slug, :content)
  end

end
