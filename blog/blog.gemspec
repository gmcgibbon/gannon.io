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

  spec.required_ruby_version = ">= 3.4.1"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/gmcgibbon/gannon.io"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "frozen_record", ">= 0.22.2"
  spec.add_dependency "rails", ">= 7.1.alpha"
  spec.add_dependency "redcarpet", ">= 3.5.1"
  spec.add_dependency "sprockets-rails", ">= 3.4.2"
  spec.add_dependency "tailwindcss-rails", ">= 0.3.3"
  spec.add_dependency "view_component", ">= 2.33.0"
end
