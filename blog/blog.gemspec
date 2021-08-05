# frozen_string_literal: true

require_relative "lib/blog/version"

Gem::Specification.new do |spec|
  spec.name        = "blog"
  spec.version     = Blog::VERSION
  spec.authors     = ["Gannon McGibbon"]
  spec.email       = ["gannon.mcgibbon@gmail.com"]
  spec.homepage    = "https://github.com/gmcgibbon/gannon.io"
  spec.summary     = "Blog"
  spec.description = "Blog for gannon.io"
  spec.license     = "MIT"

  spec.required_ruby_version = ">= 3.0"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/gmcgibbon/gannon.io"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "redcarpet", ">= 3.5.1"
  spec.add_dependency "rails", ">= 6.1.3"
  spec.add_dependency "tailwindcss-rails", ">= 0.3.3"
  spec.add_dependency "view_component", ">= 2.33.0"
  spec.add_dependency "frozen_record", ">= 0.22.2"
end
