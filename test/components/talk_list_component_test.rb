require "test_helper"

class TalkListComponentTest < ViewComponent::TestCase
  test "renders header" do
    talks = Talk.all

    render_inline(TalkListComponent.new(talks: talks))

    assert_selector("ul") do
      talks.each do |talk|
        assert_selector("li") do
          assert_selector("a", text: talk.title) do |element|
            assert_equal(talk.url, element[:href])
          end
        end
      end
    end
  end
end
