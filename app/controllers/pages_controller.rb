class PagesController < ApplicationController

  load_and_authorize_resource find_by: :slug,
                              id_param: :slug

  def new
    @page = Page.new
  end

  def create
    @page = Page.new page_params

    if @page.save
      flash[:success] = "Page was successfully created!"
      render :root
    else
      flash[:error] = "Page could not be created!"
      render :new, status: 422
    end
  end

  def edit; end

  def show; end

  def update
    if @page.update_attributes page_params
      flash[:success] = "Page was successfully updated!"
      render :root
    else
      flash[:error] = "Page could not be updated!"
      render :edit, status: 422
    end
  end

  def destroy
    if @page.destroy
      flash[:success] = "Page was successfully deleted!"
      render :root
    else
      flash[:error] = "Page could not be deleted!"
      render :edit, status: 422
    end
  end

  private

  def page_params
    params.require(:page).permit(:title, :slug, :content)
  end

end
