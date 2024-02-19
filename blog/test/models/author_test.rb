# typed: true
# frozen_string_literal: true

require "test_helper"

module Blog
  class AuthorTest < ActiveSupport::TestCase
    test "attributes" do
      assert_attributes(
        Author.first,
        id: String,
        name: String,
        url: String,
      )
    end
  end
end
