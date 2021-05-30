# frozen_string_literal: true

require "active_model"
require "yaml"
require "kramdown"

require "blog/version"
require "blog/engine"
require "blog/yaml_document"
require "blog/document_renderer"

module Blog
  mattr_accessor(:article_path)
end
