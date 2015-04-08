module MarkdownHelper

  def markdown_to_html(markdown)
    GitHub::Markdown.render_gfm(markdown).html_safe
  end
end
