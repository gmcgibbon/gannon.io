# frozen_string_literal: true

module Blog
  class Engine < ::Rails::Engine
    isolate_namespace(Blog)

    config.blog = ActiveSupport::OrderedOptions.new

    initializer("blog.set_configs") do |app|
      config.after_initialize do
        Blog.article_path = app.config.blog.article_path || Blog::Engine.root.join("app/views/articles")
      end
    end
  end
end