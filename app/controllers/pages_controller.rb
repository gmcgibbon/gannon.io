class PagesController < ApplicationController

  load_and_authorize_resource find_by: :slug,
                              id_param: :slug

  def create
    @page = Page.new page_params

    if @page.save
      flash.now[:success] = I18n.t('gannon.page.create.success')
      render :root
    else
      flash.now[:fail] = I18n.t('gannon.page.create.fail')
      render :new, status: 422
    end
  end

  def update
    if @page.update_attributes page_params
      flash.now[:success] = I18n.t('gannon.page.update.success')
      render :root
    else
      flash.now[:fail] = I18n.t('gannon.page.update.fail')
      render :edit, status: 422
    end
  end

  def destroy
    if @page.destroy
      flash.now[:success] = I18n.t('gannon.page.delete.success')
      render :root
    else
      flash.now[:fail] = I18n.t('gannon.page.delete.fail')
      render :edit, status: 422
    end
  end

  private

  def page_params
    params.require(:page).permit(:title, :slug, :content)
  end

end
