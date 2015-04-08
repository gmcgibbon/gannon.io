module MarkdownHelper

  @@markdown_options =  [
                          unknown_tags: :drop,
                          github_flavored: true,
                        ]

  @@html_options     =  {
                          filter_html:     true,
                          hard_wrap:       true,
                          link_attributes: { rel: 'nofollow', target: '_blank' },
                          space_after_headers: true,
                          fenced_code_blocks: true,
                          no_intra_emphasis: true,
                          autolink: true,
                        }

  @@markdown_parser  =  Redcarpet::Markdown.new(
                          Redcarpet::Render::HTML.new(@@html_options)
                        )

  def html_to_markdown(html)
    ReverseMarkdown.convert(html, *@@markdown_options)
  end

  def markdown_to_html(markdown)
    @@markdown_parser.render(markdown).html_safe
  end
end
