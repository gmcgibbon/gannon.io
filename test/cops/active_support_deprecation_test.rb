# frozen_string_literal: true

require "test_helper"
require "rubocop-minitest"
require "rubocop/minitest/assert_offense"
require "cops/active_support_deprecation_usage"

module Cops
  class ActiveSupportDeprecationUsageTest < ActiveSupport::TestCase
    include RuboCop::Minitest::AssertOffense

    test "offenses" do
      assert_offense(<<~RUBY)
        ::ActiveSupport::Deprecation.warn("deprecated")
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ ActiveSupport::Deprecation is deprecated, please use your your own deprecator.
      RUBY

      assert_offense(<<~RUBY)
        ActiveSupport::Deprecation.debug
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ ActiveSupport::Deprecation is deprecated, please use your your own deprecator.
      RUBY

      assert_offense(<<~RUBY)
        ActiveSupport::Deprecation.behavior
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ ActiveSupport::Deprecation is deprecated, please use your your own deprecator.
      RUBY
    end

    test "no offenses" do
      assert_no_offenses(<<~RUBY)
        ActiveSupport::Deprecation
      RUBY

      assert_no_offenses(<<~RUBY)
        Other::ActiveSupport::Deprecation.warn("deprecated")
      RUBY

      assert_no_offenses(<<~RUBY)
        ActiveSupport::Deprecation.to_json
      RUBY
    end
  end
end
