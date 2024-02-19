# typed: true
# frozen_string_literal: true

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    self.file_fixture_path = Rails.root.join("test/fixtures/files").to_s

    ApplicationRecord.base_path = Pathname.new(file_fixture_path)

    private

    def assert_attributes(model, **attribute_definitions)
      attribute_definitions.each do |attribute_name, attribute_type|
        assert_operator(model, :respond_to?, attribute_name)
        assert_instance_of(attribute_type, model.public_send(attribute_name))
      end
    end
  end
end
