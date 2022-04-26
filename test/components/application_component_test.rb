# frozen_string_literal: true

require "test_helper"
require "minitest/mock"

class ApplicationComponentTest < ViewComponent::TestCase
  test "delegates main_app to view_context" do
    main_app = Object.new
    application_component = ApplicationComponent.new
    application_component.instance_variable_set(:@view_context, mock(main_app:))

    assert_same(main_app, application_component.main_app)
  end

  test "delegates content_security_policy? to view_context" do
    application_component = ApplicationComponent.new
    application_component.instance_variable_set(:@view_context, mock(content_security_policy?: true))

    assert_predicate(application_component, :content_security_policy?)
  end

  private

  def mock(**mocks)
    mock = Minitest::Mock.new
    mocks.each do |key, value|
      mock.expect(key, value)
    end
    mock
  end
end
