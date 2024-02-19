# typed: true
# frozen_string_literal: true

module Blog
  class ArticleListComponent < ApplicationComponent
    def initialize(articles:)
      super()
      @articles = articles
    end
  end
end
