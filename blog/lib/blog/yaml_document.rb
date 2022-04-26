# frozen_string_literal: true

module Blog
  class YamlDocument
    YAML_SECTION = "---\n"
    private_constant(:YAML_SECTION)

    attr_reader(:name, :extensions, :yaml, :content)

    def self.read(file)
      name, *extensions = file.basename.to_s.split(".")
      file.open do |io|
        new(name:, extensions: extensions.reverse, io:)
      end
    end

    private

    def initialize(name:, extensions:, io:)
      @name = name
      @extensions = extensions
      @yaml = {}
      @content = ""
      read(io) unless io.eof?
    end

    def read(io)
      content_buffer = +""

      while (line = io.readline)
        if line == YAML_SECTION
          read_yaml(io)
        else
          content_buffer << line
        end

        break if io.eof?
      end

      @content = content_buffer.strip << "\n"
    end

    def read_yaml(io)
      yaml_buffer = +""

      until (line = io.readline) == YAML_SECTION
        yaml_buffer << line
      end

      @yaml = YAML.safe_load(
        yaml_buffer,
        symbolize_names: true,
        permitted_classes: [Date],
      )
    end
  end
end
