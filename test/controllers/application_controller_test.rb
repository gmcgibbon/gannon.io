# frozen_string_literal: true

require "test_helper"

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get("/")

    assert_select("title", text: "Gannon")
    assert_select("h1", text: "Gannon")
    assert_select("p", text: "👋")
  end
end
