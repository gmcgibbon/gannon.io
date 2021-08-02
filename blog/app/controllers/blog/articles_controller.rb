# frozen_string_literal: true

module Blog
  class ArticlesController < ApplicationController
    def index
      @articles = Article.all

      respond_to do |format|
        format.html
        format.xml { render(layout: false) }
      end
    end

    def show
      @article = Article.find(params[:id])

      redirect_to(@article.url) if @article.external?
    end
  end
end
