# typed: true
# frozen_string_literal: true

module Blog
  class ApplicationComponent < ::ApplicationComponent
    T.unsafe(self).include(Engine.routes.url_helpers)
  end
end
