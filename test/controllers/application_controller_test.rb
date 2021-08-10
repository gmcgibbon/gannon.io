# frozen_string_literal: true

require "test_helper"

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get("/")

    assert_select("title", text: "Gannon McGibbon")
    assert_select("meta[name=description]") do |(element)|
      assert_equal("Programming and stuff.", element[:content])
    end
    assert_select("h1", text: "Gannon McGibbon")
    assert_select("p", text: /👋/)
  end
end
