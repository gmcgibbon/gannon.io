# frozen_string_literal: true

require "active_model"
require "yaml"

require "blog/version"
require "blog/engine"
require "blog/yaml_document"

module Blog
  mattr_accessor(:article_path)
end