# frozen_string_literal: true

module Blog
  class ArticleListComponent < ApplicationComponent
    def initialize(articles:)
      @articles = articles
    end

    private

    def link_to_article(article, &block)
      if article.external?
        link_to(article.url, &block)
      else
        link_to(article, &block)
      end
    end
  end
end
