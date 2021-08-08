# frozen_string_literal: true

require "test_helper"

module Blog
  class ArticlesControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test "index lists articles" do
      get("/blog")

      assert_select("title", text: "Gannon's Blog")
      assert_select("h1", text: "Gannon's Blog")
      Article.latest.each do |article|
        assert_select("li") do
          assert_select("h2", text: article.title)
          assert_select("p", text: article.created_at.to_s(:long))
        end
      end
    end

    test "index xml shows atom feed" do
      get("/blog.xml")

      assert_select("title", text: "Gannon's Blog")
      Article.latest.each do |article|
        assert_select("entry title", article.title)
      end
    end

    test "show renders article" do
      article = Article.find("test-1-plain")

      get("/blog/articles/#{article.id}")

      assert_select("title", text: "Plain Test")
      assert_select("h1", text: "Plain Test")
      assert_select("h2", text: "Hello world")
      assert_select("p", text: "This is an article.")
    end

    test "show redirects to external article" do
      article = Article.find("test-3-external")

      get("/blog/articles/#{article.id}")

      assert_redirected_to(article.url)
    end
  end
end
