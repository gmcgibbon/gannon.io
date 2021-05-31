# frozen_string_literal: true

module Blog
  class Article < ApplicationModel
    attributes(:file, :id, :title, :author, :content, :created_at, :updated_at)

    after_initialize(:load_file)

    class << self
      def all
        @all ||= Blog.article_path.glob("*").map { |file| Article.new(file: file) }
      end

      def find(id)
        all.find { |record| record.id == id } || raise(
          ApplicationModel::NotFoundError,
          "Couldn't find #{self} with id of \"#{id}\".",
        )
      end
    end

    def render_in(context)
      _, *extensions = yaml_document.name.split(".")
      DocumentRenderer.render(content, extensions: extensions.reverse, context: context)
    end

    private

    def load_file # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity
      return unless file

      self.id     ||= yaml_document.name.split(".").first
      self.title  ||= yaml_document.yaml.fetch(:title)
      self.author ||= Author.find(yaml_document.yaml.fetch(:author))
      self.content    ||= yaml_document.content
      self.created_at ||= yaml_document.yaml.fetch(:created_at)
      self.updated_at ||= yaml_document.yaml.fetch(:updated_at)
    end

    def yaml_document
      @yaml_document ||= YamlDocument.read(file, name: file.basename)
    end
  end
end
