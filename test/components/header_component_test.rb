require "test_helper"

class HeaderComponentTest < ViewComponent::TestCase
  test "renders header" do
    render_inline(HeaderComponent.new)


    assert_selector("header") do
      assert_selector("a", text: "Blog") do |element|
        assert_equal("/blog", element["href"])
      end
    end
  end
end
