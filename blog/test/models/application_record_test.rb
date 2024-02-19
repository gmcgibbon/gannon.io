# typed: true
# frozen_string_literal: true

require "test_helper"

module Blog
  class ApplicationRecordTest < ActiveSupport::TestCase
    test ".auto_reloading?" do
      assert_predicate(ApplicationRecord, :auto_reloading?)
    end
  end
end
