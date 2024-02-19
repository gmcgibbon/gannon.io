# typed: true
# frozen_string_literal: true

require "test_helper"

module Blog
  class ArticleTest < ActiveSupport::TestCase
    test "attributes" do
      assert_attributes(
        Article.first,
        id: String,
        title: String,
        description: String,
        author_id: String,
        content: String,
        created_at: Date,
        updated_at: Date,
      )
    end

    test ".backend" do
      assert_equal(ArticleContext::Backend, Article.backend)
    end

    test ".last_updated_at" do
      assert_equal(Article.find("test-1-plain").updated_at, Article.last_updated_at)
    end

    test ".latest" do
      assert_equal(Article.all.sort_by(&:created_at).reverse, Article.latest)
    end

    test ".file_changed?" do
      assert_not_predicate(Article, :file_changed?)

      FileUtils.touch(file_fixture("blog/articles/test-1-plain.md.erb"))

      assert_predicate(Article, :file_changed?)
    end

    test "#author" do
      assert_instance_of(Author, Article.find("test-1-plain").author)
    end

    test "#external?" do
      assert_predicate(Article.find("test-3-external"), :external?)
    end

    test "#render_in" do
      today = Time.zone.today.strftime("%A")

      context = time_context(day: today)

      compiled_content = Article.find("test-2-erb").render_in(context)

      assert_equal(<<~HTML, compiled_content)
        <h2>Hello world</h2>

        <p>This is an article. Today is #{today}.</p>
      HTML
    end

    private

    def plain_context
      # TODO: Fix upstream
      T.unsafe(Struct).new.new
    end

    def time_context(day:)
      Struct.new(:day).new(day)
    end
  end
end
