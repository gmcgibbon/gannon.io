# frozen_string_literal: true

module Blog
  class ApplicationComponent < ::ApplicationComponent
    include(Engine.routes.url_helpers)
  end
end