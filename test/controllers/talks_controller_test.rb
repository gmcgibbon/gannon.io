require "test_helper"

class TalksControllerTest < ActionDispatch::IntegrationTest
  test "index lists talks" do
    get("/talks")

    Talk.all.each do |talk|
      assert_select("li", talk.title)
    end
  end
end
