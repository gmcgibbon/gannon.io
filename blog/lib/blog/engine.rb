# frozen_string_literal: true

module Blog
  class Engine < ::Rails::Engine
    isolate_namespace(Blog)

    config.blog = ActiveSupport::OrderedOptions.new
  end
end
