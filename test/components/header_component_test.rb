# typed: true
# frozen_string_literal: true

require "test_helper"

class HeaderComponentTest < ViewComponent::TestCase
  test "renders header" do
    render_inline(HeaderComponent.new)

    assert_selector("header") do
      assert_selector("#home") do |element|
        assert_equal("/", element["href"])
      end
      assert_selector("#blog") do |element|
        assert_equal("/blog", element["href"])
      end
      assert_selector("#talks") do |element|
        assert_equal("/talks", element["href"])
      end
      assert_selector("#github") do |element|
        assert_equal("https://github.com/gmcgibbon", element["href"])
      end
      assert_selector("#dark-toggle") do |element|
        assert_equal("#", element["href"])
      end
    end
  end
end
