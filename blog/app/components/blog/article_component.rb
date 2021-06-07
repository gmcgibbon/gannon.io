# frozen_string_literal: true

module Blog
  class ArticleComponent < ApplicationComponent
    def initialize(article:)
      @article = article
    end
  end
end