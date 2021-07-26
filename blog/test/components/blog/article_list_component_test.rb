# frozen_string_literal: true

require "test_helper"

module Blog
  class ArticleListComponentTest < ViewComponent::TestCase
    test "renders articles" do
      articles = Article.all

      render_inline(ArticleListComponent.new(articles: articles))

      assert_selector("ul") do
        articles.each do |article|
          assert_selector("li", text: "#{article.title} (#{article.created_at.to_s(:long)})")
        end
      end
    end
  end
end
