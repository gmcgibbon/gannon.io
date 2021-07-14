# frozen_string_literal: true

require "test_helper"

module Blog
  class NavigationTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test "redirects to article index" do
      get("/blog")

      assert_redirected_to("/blog/articles")
    end
  end
end
