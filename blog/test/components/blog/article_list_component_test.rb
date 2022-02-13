# frozen_string_literal: true

require "test_helper"

module Blog
  class ArticleListComponentTest < ViewComponent::TestCase
    test "renders articles" do
      articles  = Article.all
      component = ArticleListComponent.new(articles: articles)

      render_inline(component)

      assert_selector("ul") do
        articles.each do |article|
          assert_selector("li a", text: /#{article.title}/) do |element|
            assert_selector("h2", text: article.title)
            assert_selector("p", text: article.created_at.to_fs(:long))
            assert_equal(component.article_path(article), element[:href])
          end
        end
      end
    end
  end
end
