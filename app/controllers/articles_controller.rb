class ArticlesController < ApplicationController

  load_and_authorize_resource find_by: :slug,
                              id_param: :slug

  def index
    @articles = Article.limit(10)
  end

  def create
    @article = Article.new article_params

    if @article.save
      flash[:success] = I18n.t('gannon.record.create.success', record: Article.name)
      render :root
    else
      flash[:fail] = I18n.t('gannon.record.create.fail', record: Article.name)
      render :new, status: 422
    end
  end

  def update
    if @article.update_attributes article_params
      flash[:success] = I18n.t('gannon.record.update.success', record: Article.name)
      render :root
    else
      flash[:fail] = I18n.t('gannon.record.update.fail', record: Article.name)
      render :edit, status: 422
    end
  end

  def destroy
    if @article.destroy
      flash[:success] = I18n.t('gannon.record.delete.success', record: Article.name)
      render :root
    else
      flash[:fail] = I18n.t('gannon.record.delete.fail', record: Article.name)
      render :edit, status: 422
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :slug, :content)
  end

end
