# frozen_string_literal: true

require "test_helper"

class TalkTest < ActiveSupport::TestCase
  test "attributes" do
    assert_attributes(
      Talk.first,
      id: String,
      title: String,
      description: String,
      url: String,
    )
  end

  test "#conference" do
    assert_equal("Some Conference 444", Talk.new(id: "some_conference_444").conference)
  end
end
