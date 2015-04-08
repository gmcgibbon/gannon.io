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

  # get markdown content as html
  def content_as_html
    markdown_to_html(self.content)
  end

  def content_as_plain
    markdown_to_plain(self.content)
  end

  # use slug for parameter/url generation
  def to_param
    self.slug
  end
end
