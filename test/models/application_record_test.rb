# frozen_string_literal: true

require "test_helper"

class ApplicationRecordTest < ActiveSupport::TestCase
  test ".auto_reloading?" do
    assert_predicate(ApplicationRecord, :auto_reloading?)
  end
end
