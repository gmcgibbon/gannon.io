# frozen_string_literal: true

require "yaml"
require "active_model"
require "kramdown"
require "view_component"

require "blog/version"
require "blog/engine"
require "blog/yaml_document"
require "blog/document_renderer"

module Blog
  mattr_accessor(:article_path)
end
