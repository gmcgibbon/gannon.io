# frozen_string_literal: true

module Blog
  class ArticleListComponent < ApplicationComponent
    def initialize(articles:)
      @articles = articles
    end
  end
end