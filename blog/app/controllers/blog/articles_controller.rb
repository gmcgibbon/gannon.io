# typed: true
# frozen_string_literal: true

module Blog
  class ArticlesController < ApplicationController
    def index
      @articles = Article.latest

      respond_to do |format|
        format.html
        format.xml { render(layout: false) }
      end
    end

    def show
      @article = Article.find(params[:id])

      redirect_to(@article.url, allow_other_host: true) if @article.external?
    end
  end
end
