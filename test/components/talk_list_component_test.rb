# frozen_string_literal: true

require "test_helper"

class TalkListComponentTest < ViewComponent::TestCase
  test "renders talks list" do
    talks = Talk.all

    render_inline(TalkListComponent.new(talks:))

    assert_selector("ul") do
      talks.each do |talk|
        assert_selector("li") do
          assert_selector("a") do |element|
            assert_equal(talk.url, element[:href])
            assert_selector("h2", text: talk.title)
            assert_selector("h3", text: talk.conference)
            assert_selector("p", text: talk.description)
          end
        end
      end
    end
  end
end
