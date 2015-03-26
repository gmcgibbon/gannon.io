class PagesController < ApplicationController

  load_and_authorize_resource find_by: :slug,
                              id_param: :slug

  def create
    @page = Page.new page_params

    if @page.save
      flash[:success] = I18n.t('gannon.record.create.success', record: Page.name)
      redirect_to @page
    else
      flash.now[:fail] = I18n.t('gannon.record.create.fail', record: Page.name)
      render :new, status: 422
    end
  end

  def update
    if @page.update_attributes page_params
      flash[:success] = I18n.t('gannon.record.update.success', record: Page.name)
      redirect_to @page
    else
      @page.slug = Page.find(@page.id).slug

      flash.now[:fail] = I18n.t('gannon.record.update.fail', record: Page.name)
      render :edit, status: 422
    end
  end

  def destroy
    if @page.destroy
      flash[:success] = I18n.t('gannon.record.destroy.success', record: Page.name)
      redirect_to :root
    else
      flash.now[:fail] = I18n.t('gannon.record.destroy.fail', record: Page.name)
      render :edit, status: 422
    end
  end

  private

  def page_params
    params.require(:page).permit(:title, :slug, :content)
  end

end
