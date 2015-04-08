module Document
  extend ActiveSupport::Concern

  include MarkdownHelper

  included do
    validates_presence_of   :slug, :title, :content
    validates_uniqueness_of :slug
    validates_format_of     :slug,  with: /\A[a-z0-9-]+\Z/,
                                    message: I18n.t('gannon.slug.validation.format')
  end

  class_methods { }

  # get html content as markdown
  def content_markdown
    html_to_markdown(self.content)
  end

  # set html content as markdown
  def content_markdown=(markdown)
    self.content = markdown_to_html(markdown)
  end

  # use slug for parameter/url generation
  def to_param
    self.slug
  end
end
