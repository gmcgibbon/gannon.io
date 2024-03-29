# frozen_string_literal: true

require "test_helper"

class ApplicationPageComponentTest < ViewComponent::TestCase
  test "renders page" do
    render_inline(ApplicationPageComponent.new) do |page|
      page.with_title { "Test" }
      page.with_title { "Description Text" }
      page.with_body { "Hello world" }
    end

    assert_selector("html") do
      assert_selector("body") do
        assert_selector("header")
        assert_selector("section", text: "Hello world")
        assert_selector("footer")
      end
    end
  end
end
