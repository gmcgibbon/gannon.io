# frozen_string_literal: true

require "test_helper"

module Blog
  class ArticleComponentTest < ViewComponent::TestCase
    test "renders article" do
      article = Article.all.first

      render_inline(ArticleComponent.new(article: article))

      assert_selector("article") do
        assert_selector("h2", text: "Hello world")
        assert_selector("p", text: "May 30, 2021")
        assert_selector("p", text: "This is an article.")
      end
    end
  end
end
