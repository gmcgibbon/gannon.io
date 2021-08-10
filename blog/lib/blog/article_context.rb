# frozen_string_literal: true

module Blog
  module ArticleContext
    class Document < YamlDocument
      def to_h
        {
          "id" => name,
          "extensions" => extensions,
          "title" => yaml.fetch(:title),
          "description" => yaml.fetch(:description),
          "author_id" => yaml.fetch(:author),
          "content" => content,
          "url" => yaml.fetch(:url, nil),
          "created_at" => yaml.fetch(:created_at),
          "updated_at" => yaml.fetch(:updated_at),
        }
      end
    end

    module Backend
      class << self
        def filename(model_name)
          model_name.underscore.pluralize
        end

        def load(file_path)
          Pathname.new(file_path).glob("*.md.erb").map do |file|
            Document.read(file).to_h
          end
        end
      end
    end
  end
end
