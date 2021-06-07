require "test_helper"

module Blog
  class ArticleComponentTest < ViewComponent::TestCase
    test "renders article" do
      article = Article.all.first

      render_inline(ArticleComponent.new(article: article))

      assert_selector("article") do
        assert_selector("h1", text: "Hello world")
        assert_selector("p", text: "This is an article.")
      end
    end
  end
end