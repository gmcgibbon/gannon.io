# typed: true
# frozen_string_literal: true

module Blog
  class ArticleComponent < ApplicationComponent
    def initialize(article:)
      super()
      @article = article
    end
  end
end
