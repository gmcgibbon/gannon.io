class ArticlesController < ApplicationController

  load_and_authorize_resource find_by: :slug,
                              id_param: :slug

  def index
    @articles = Article.limit(10)
  end

  def create
    @article      = Article.new article_params
    @article.user = current_user

    if @article.save
      flash.now[:success] = I18n.t('gannon.record.create.success', record: Article.name)
      render :root
    else
      flash.now[:fail] = I18n.t('gannon.record.create.fail', record: Article.name)
      render :new, status: 422
    end
  end

  def update
    if @article.update_attributes article_params
      flash.now[:success] = I18n.t('gannon.record.update.success', record: Article.name)
      render :show
    else
      @article.slug = Article.find(@article.id).slug

      flash.now[:fail] = I18n.t('gannon.record.update.fail', record: Article.name)
      render :edit, status: 422
    end
  end

  def destroy
    if @article.destroy
      flash.now[:success] = I18n.t('gannon.record.destroy.success', record: Article.name)
      render :root
    else
      flash.now[:fail] = I18n.t('gannon.record.destroy.fail', record: Article.name)
      render :edit, status: 422
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :slug, :content)
  end

end
