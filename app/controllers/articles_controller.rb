class ArticlesController < ApplicationController

  include SlugResourceAuthorizable

  def search
    query         = 'title LIKE :search OR content LIKE :search'
    @search_term  = params[:search]
    @articles     = Article
      .where(query, search: "%#{@search_term}%")
      .paginate(page: params[:page], per_page: 10)
      .order('updated_at DESC')

    if request.xhr?
      render partial: 'articles/paginated'
    end
  end

  def index
    @articles = Article
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

  def update
    if @article.update_attributes article_params
      flash[:success] = I18n.t('gannon.record.update.success', record: Article.name)
      redirect_to @article
    else
      @article.slug = Article.find(@article.id).slug

      flash.now[:fail] = I18n.t('gannon.record.update.fail', record: Article.name)
      render :edit, status: 422
    end
  end

  def destroy
    if @article.destroy
      flash[:success] = I18n.t('gannon.record.destroy.success', record: Article.name)
      redirect_to :root
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
