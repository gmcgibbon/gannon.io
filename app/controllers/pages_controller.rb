class PagesController < ApplicationController

  load_and_authorize_resource find_by: :slug,
                              id_param: :slug

  def new
    @page = Page.new
  end

  def create
    @page = Page.new page_params

    if @page.save
      flash[:success] = I18n.t('gannon.page.create.success')
      render :root
    else
      flash[:fail] = I18n.t('gannon.page.create.fail')
      render :new, status: 422
    end
  end

  def edit; end

  def show; end

  def update
    if @page.update_attributes page_params
      flash[:success] = I18n.t('gannon.page.update.success')
      render :root
    else
      flash[:fail] = I18n.t('gannon.page.update.fail')
      render :edit, status: 422
    end
  end

  def destroy
    if @page.destroy
      flash[:success] = I18n.t('gannon.page.delete.success')
      render :root
    else
      flash[:fail] = I18n.t('gannon.page.delete.fail')
      render :edit, status: 422
    end
  end

  private

  def page_params
    params.require(:page).permit(:title, :slug, :content)
  end

end
