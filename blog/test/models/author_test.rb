# frozen_string_literal: true

require "test_helper"

module Blog
  class AuthorTest < ActiveSupport::TestCase

    test "attributes" do
      assert_attributes(Author.new, :id, :name, :avatar, :url)
    end

    test ".all loads all authors" do
      assert_equal(
        [
          Author.new(
            id: "gannon",
            name: "Gannon McGibbon",
            avatar: "/authors/avatars/me.jpg",
            url: "https://gannon.io/about",
          )
        ],
        Author.all,
      )
    end

    test ".all is memoized" do
      assert_same(Author.all, Author.all)
    end

    test ".find finds by id" do
      assert_instance_of(Author, Author.find("gannon"))
    end

    test ".find raises when not found" do
      error = assert_raises(ApplicationModel::NotFoundError) do
        puts Author.find("not-here").inspect
      end

      assert_equal("Couldn't find Blog::Author with id of \"not-here\".", error.message)
    end
  end
end