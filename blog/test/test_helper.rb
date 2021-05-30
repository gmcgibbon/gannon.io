# frozen_string_literal: true

ENV["RAILS_ENV"] = "test"
require_relative "../../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    self.file_fixture_path = "#{Blog::Engine.root}/test/fixtures/files"

    Blog.article_path = Pathname("#{file_fixture_path}/articles")

    private

    def assert_attributes(model, *attribute_keys)
      attribute_keys.each do |attribute_key|
        assert_operator(attribute_key, :in?, model.class._attribute_definitions)
      end
    end
  end
end
