# frozen_string_literal: true

require "test_helper"

module Blog
  class ApplicationComponentTest < ViewComponent::TestCase
    test "includes engine route helpers" do
      assert_includes(ApplicationComponent.included_modules, Engine.routes.url_helpers)
    end
  end
end
