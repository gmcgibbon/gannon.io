# typed: true
# frozen_string_literal: true

module Blog
  class Article < ApplicationRecord
    self.backend = ArticleContext::Backend

    scope(:last_updated_at, -> { maximum(:updated_at) })
    scope(:latest, -> { all.sort_by(&:created_at).reverse })

    class << self
      def file_changed?
        last_mtime = @file_mtime
        @file_mtime = Pathname.new(file_path).glob("*.md.erb").map(&:mtime).max
        last_mtime != @file_mtime
      end
    end

    def external?
      url.present?
    end

    def author
      Author.find(author_id)
    end

    def render_in(context)
      DocumentRenderer.render(content, extensions:, context:)
    end
  end
end
