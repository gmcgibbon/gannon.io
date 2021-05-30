# frozen_string_literal: true

require "test_helper"

module Blog
  class ArticleTest < ActiveSupport::TestCase
    test "attributes" do
      assert_attributes(Article.new, :file, :id, :title, :author, :content, :created_at, :updated_at)
    end

    test ".all loads all articles" do
      assert_equal(
        [Article.new(file: file_fixture("articles/test-1.md.erb"))],
        Article.all,
      )
    end

    test ".all is memoized" do
      assert_same(Article.all, Article.all)
    end

    test ".find finds by id" do
      assert_instance_of(Article, Article.find("test-1"))
    end

    test "reads yaml document file" do
      article = Article.new(file: file_fixture("articles/test-1.md.erb"))

      assert_equal("test-1", article.id)
      assert_equal("Test", article.title)
      assert_equal(Author.find("gannon"), article.author)
      assert_equal(<<~CONTENT, article.content)
        # Hello world
        
        This is an article.
      CONTENT
      assert_equal(Date.parse("2021-05-30"), article.created_at)
      assert_equal(Date.parse("2021-05-30"), article.updated_at)
    end
  end
end