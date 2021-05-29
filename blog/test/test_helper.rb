# frozen_string_literal: true

ENV["RAILS_ENV"] = "test"
require_relative "../../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    self.file_fixture_path = "#{Rails.root}/test/fixtures/files"
  end
end
