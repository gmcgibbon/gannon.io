# frozen_string_literal: true

require "test_helper"

class TalksControllerTest < ActionDispatch::IntegrationTest
  test "index lists talks" do
    get("/talks")

    assert_select("title", text: "Gannon's Talks")
    assert_select("h1", text: "Gannon's Talks")
    Talk.all.each do |talk|
      assert_select("li", talk.title)
    end
  end
end
