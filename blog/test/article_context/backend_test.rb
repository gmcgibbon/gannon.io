# typed: true
# frozen_string_literal: true

require "test_helper"

module Blog
  module ArticleContext
    class BackendTest < ActiveSupport::TestCase
      test ".filename" do
        assert_equal("some_models", Backend.filename("SomeModel"))
      end

      test ".load" do
        assert_equal(Article.all.map(&:attributes), Backend.load(file_fixture("blog/articles")))
      end
    end
  end
end
