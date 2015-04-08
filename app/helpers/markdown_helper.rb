module MarkdownHelper

  # converts Markdown to HTML
  def markdown_to_html(markdown)
    GitHub::Markdown.render_gfm(markdown).html_safe
  end

  # converts Markdown to HTML to plain text
  def markdown_to_plain(markdown)
    ActionController::Base.helpers.strip_tags(markdown_to_html(markdown))
  end
end
