# frozen_string_literal: true

require "test_helper"

class NavigationTest < ActionDispatch::IntegrationTest
  test "redirects to blog" do
    get("/")

    assert_redirected_to("/blog")
  end
end