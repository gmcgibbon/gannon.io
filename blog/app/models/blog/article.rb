# frozen_string_literal: true

module Blog
  class Article < ApplicationModel
    attributes(:file, :id, :extensions, :title, :author, :content, :created_at, :updated_at)

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
      load_file

      DocumentRenderer.render(content, extensions: extensions, context: context)
    end

    private

    attr_accessor(:mtime)

    def file_changed?
      file && file.mtime != mtime
    end

    def load_file # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity
      return unless file_changed?

      YamlDocument.read(file).tap do |document|
        self.mtime      = file.mtime
        self.id         = document.name
        self.extensions = document.extensions
        self.title      = document.yaml.fetch(:title)
        self.author     = Author.find(document.yaml.fetch(:author))
        self.content    = document.content
        self.created_at = document.yaml.fetch(:created_at)
        self.updated_at = document.yaml.fetch(:updated_at)
      end
    end
  end
end
