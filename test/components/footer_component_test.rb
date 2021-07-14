# frozen_string_literal: true

require "test_helper"

class FooterComponentTest < ViewComponent::TestCase
  test "renders footer" do
    render_inline(FooterComponent.new)

    assert_selector("footer", text: "")
  end
end
