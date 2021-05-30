# frozen_string_literal: true

module Blog
  class DocumentRenderer
    class << self
      def render(text, extensions:, context:)
        extensions.reduce(text) do |result, extension|
          send(:"render_#{extension}", result, context: context)
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
        # TODO: Maybe find a safer way to escape here.
        Kramdown::Document.new(text).to_html.html_safe
      end
    end
  end
end
