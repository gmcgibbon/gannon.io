require "test_helper"

class HeaderComponentTest < ViewComponent::TestCase
  test "renders header" do
    render_inline(HeaderComponent.new)


    assert_selector("header") do
      assert_selector("a", text: "Blog") do |element|
        assert_equal("/blog/articles", element["href"])
      end
      assert_selector("a", text: "Talks") do |element|
        assert_equal("/talks", element["href"])
      end
    end
  end
end
