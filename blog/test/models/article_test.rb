# frozen_string_literal: true

require "test_helper"

module Blog
  class ArticleTest < ActiveSupport::TestCase
    test "attributes" do
      assert_attributes(Article.new, :file, :id, :title, :author, :content, :created_at, :updated_at)
    end

    test ".all loads all articles" do
      assert_equal(
        [
          Article.new(file: file_fixture("articles/test-1-plain.md.erb")),
          Article.new(file: file_fixture("articles/test-2-erb.md.erb"))
        ],
        Article.all,
      )
    end

    test ".all is memoized" do
      assert_same(Article.all, Article.all)
    end

    test ".find finds by id" do
      assert_instance_of(Article, Article.find("test-1-plain"))
    end

    test "reads yaml document file" do
      article = Article.new(file: file_fixture("articles/test-1-plain.md.erb"))

      assert_equal("test-1-plain", article.id)
      assert_equal(%w(erb md), article.extensions)
      assert_equal("Plain Test", article.title)
      assert_equal(Author.find("gannon"), article.author)
      assert_equal(<<~CONTENT, article.content)
        ## Hello world

        This is an article.
      CONTENT
      assert_equal(Date.parse("2021-05-30"), article.created_at)
      assert_equal(Date.parse("2021-05-30"), article.updated_at)
    end

    test "#render_in" do
      today = Date.today.strftime("%A")

      context = time_context(day: today)

      compiled_content = Article.find("test-2-erb").render_in(context)

      assert_equal(<<~HTML, compiled_content)
        <h2 id="hello-world">Hello world</h2>

        <p>This is an article. Today is #{today}.</p>
      HTML
    end

    test "#render_in reloads file when changed" do
      today = Date.today.strftime("%A")

      context = time_context(day: today)

      article = Article.find("test-2-erb")

      compiled_content = article.render_in(context)

      article.file = file_fixture("articles/test-1-plain.md.erb")

      assert_not_equal(compiled_content, article.render_in(context))
    end

    private

    def plain_context
      Struct.new.new
    end

    def time_context(day:)
      Struct.new(:day).new(day)
    end
  end
end
