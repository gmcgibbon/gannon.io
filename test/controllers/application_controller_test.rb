require "test_helper"

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get("/")

    assert_select("title", text: "Gannon 🤔")
    assert_select("p", text: "👋")
  end
end
