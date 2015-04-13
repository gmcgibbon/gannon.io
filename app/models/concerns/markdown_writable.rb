module MarkdownWritable
  extend ActiveSupport::Concern

  include MarkdownHelper

  included do
    validates_presence_of :content
  end

  class_methods { }

  # get markdown content as html
  def content_as_html
    markdown_to_html(self.content)
  end

  # get markdown content as plain text
  def content_as_plain
    markdown_to_plain(self.content)
  end
end
