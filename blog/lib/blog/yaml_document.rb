# frozen_string_literal: true

module Blog
  class YamlDocument
    YAML_SECTION = "---\n"
    private_constant(:YAML_SECTION)

    attr_reader(:name, :yaml, :content)

    def self.read(file, name: nil)
      file.open do |io|
        new(name: name.to_s, io: io)
      end
    end

    private

    def initialize(name:, io:)
      @name = name
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
