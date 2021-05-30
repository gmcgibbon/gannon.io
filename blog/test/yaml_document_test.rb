# frozen_string_literal: true

require "test_helper"

module Blog
  class YamlDocumentTest < ActiveSupport::TestCase
    class FakeFile < Struct.new(:string)
      def open
        yield(StringIO.new(string)) if block_given?
      end
    end

    test ".read parses yaml header" do
      document = YamlDocument.read(file_with_yaml_section)

      assert_equal({ key: "value", foo: ["bar"], test: true, date: Date.parse("1999-01-02") }, document.yaml)
      assert_equal(<<~CONTENT, document.content)
        # Helo world

        This is a test with a YAML section.
      CONTENT
    end

    test ".read trims excess whitespace" do
      document = YamlDocument.read(file_with_whitespace)

      assert_equal({ key: "value" }, document.yaml)
      assert_equal(<<~CONTENT, document.content)
        # Helo world

        This is a test with whitespace.
      CONTENT
    end

    test ".read works without yaml header" do
      document = YamlDocument.read(file)

      assert_equal({}, document.yaml)
      assert_equal(<<~CONTENT, document.content)
        # Helo world

        This is a test without a YAML section.
      CONTENT
    end

    test ".read without name default to blank string" do
      document = YamlDocument.read(blank_file)

      assert_equal("", document.name)
      assert_equal("", document.content)
    end

    test ".read with name" do
      document = YamlDocument.read(blank_file, name: "some-identifier")

      assert_equal("some-identifier", document.name)
      assert_equal("", document.content)
    end

    private

    def file_with_yaml_section
      FakeFile.new(<<~YAML)
        ---
        key: value
        foo:
          - bar
        test: true
        date: 1999-01-02
        ---

        # Helo world

        This is a test with a YAML section.
      YAML
    end

    def file_with_whitespace
      FakeFile.new(<<~YAML)



        ---
        key: value
        ---


        # Helo world

        This is a test with whitespace.

      YAML
    end

    def file
      FakeFile.new(<<~YAML)
        # Helo world

        This is a test without a YAML section.
      YAML
    end

    def blank_file
      FakeFile.new("")
    end
  end
end