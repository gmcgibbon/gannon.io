# frozen_string_literal: true

module Blog
  class DocumentRenderer
    class << self
      def render(text, extensions:, context:)
        extensions.reduce(text) do |result, extension|
          send(:"render_#{extension}", result, context:)
        end
      end

      private

      def render_erb(text, context:)
        # HACK: What is the proper way to do this with a view context?
        result = nil
        context.instance_eval { result = ERB.new(text).result(binding) }
        result
      end

      def render_md(text, context:) # rubocop:disable Lint/UnusedMethodArgument
        markdown_parser.render(text).html_safe
      end

      def markdown_parser
        @markdown_parser ||= Redcarpet::Markdown.new(
          Redcarpet::Render::HTML, fenced_code_blocks: true, tables: true,
        )
      end
    end
  end
end
