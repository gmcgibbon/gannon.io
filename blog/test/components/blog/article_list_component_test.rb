# frozen_string_literal: true

require "test_helper"

module Blog
  class ArticleListComponentTest < ViewComponent::TestCase
    test "renders articles" do
      articles  = Article.all.reject(&:external?)
      component = ArticleListComponent.new(articles: articles)

      render_inline(component)

      assert_selector("ul") do
        articles.each.with_index do |article, index|
          assert_selector("li a", text: /#{article.title}/) do |element|
            assert_selector("h2", text: article.title)
            assert_selector("p", text: article.created_at.to_s(:long))
            assert_equal(component.article_path(article), element[:href])
          end
        end
      end
    end

    test "renders external articles" do
      articles  = Article.all.select(&:external?)
      component = ArticleListComponent.new(articles: articles)

      render_inline(component)

      assert_selector("ul") do
        articles.each.with_index do |article, index|
          assert_selector("li a", text: /#{article.title}/) do |element|
            assert_selector("h2", text: article.title)
            assert_selector("p", text: article.created_at.to_s(:long))
            assert_equal(article.url, element[:href])
          end
        end
      end
    end
  end
end
