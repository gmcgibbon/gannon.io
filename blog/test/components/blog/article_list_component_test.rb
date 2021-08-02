# frozen_string_literal: true

require "test_helper"

module Blog
  class ArticleListComponentTest < ViewComponent::TestCase
    test "renders articles" do
      articles  = Article.all.reject(&:external?)
      component = ArticleListComponent.new(articles: articles)

      render_inline(component)

      assert_selector("ul") do
        articles.each do |article|
          assert_selector("li a", text: "#{article.title} (#{article.created_at.to_s(:long)})") do |element|
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
        articles.each do |article|
          assert_selector("li a", text: "#{article.title} (#{article.created_at.to_s(:long)})") do |element|
            assert_equal(article.url, element[:href])
          end
        end
      end
    end
  end
end
