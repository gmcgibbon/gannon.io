class ArticlesController < ApplicationController

  load_and_authorize_resource find_by: :slug,
                              id_param: :slug

  def index
    @articles = Article.limit(10)
  end

  def create
    @article = Article.new article_params

    if @article.save
      flash[:success] = I18n.t('gannon.article.create.success')
      render :root
    else
      flash[:fail] = I18n.t('gannon.article.create.fail')
      render :new, status: 422
    end
  end

  def update
    if @article.update_attributes article_params
      flash[:success] = I18n.t('gannon.article.update.success')
      render :root
    else
      flash[:fail] = I18n.t('gannon.article.update.fail')
      render :edit, status: 422
    end
  end

  def destroy
    if @article.destroy
      flash[:success] = I18n.t('gannon.article.delete.success')
      render :root
    else
      flash[:fail] = I18n.t('gannon.article.delete.fail')
      render :edit, status: 422
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :slug, :content)
  end

end
