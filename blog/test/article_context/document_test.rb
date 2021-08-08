# frozen_string_literal: true

require "test_helper"

module Blog
  module ArticleContext
    class DocumentTest < ActiveSupport::TestCase
      setup do
        @document = Document.read(file_fixture("blog/articles/test-1-plain.md.erb"))
      end

      test "#to_h" do
        attributes = {
          "id" => "test-1-plain",
          "extensions" => %w(erb md),
          "title" => "Plain Test",
          "author_id" => "some_author",
          "url" => nil,
          "content" => <<~MARKDOWN,
                        ## Hello world

                        This is an article.
          MARKDOWN
          "created_at" => Date.parse("2021-05-30"),
          "updated_at" => Date.parse("2021-06-30"),
        }

        assert_equal(attributes, @document.to_h)
      end
    end
  end
end
