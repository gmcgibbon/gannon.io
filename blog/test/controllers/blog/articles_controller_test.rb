# frozen_string_literal: true

require "test_helper"

module Blog
  class ArticlesControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test "index lists articles" do
      get("/blog/articles")

      assert_select("title", text: "Gannon's Blog")
      assert_select("h1", text: "Gannon's Blog")
      Article.all.each do |article|
        assert_select("li", article.title)
      end
    end

    test "show renders article" do
      article = Article.find("test-1-plain")

      get("/blog/articles/#{article.id}")

      assert_select("title", text: "Plain Test")
      assert_select("h1", "Hello world")
      assert_select("p", "This is an article.")
    end
  end
end
