# typed: true

module ActionController
  module Caching
    module Actions
      module ClassMethods
        def caches_action(*action_names, options); end
      end
    end
  end
end
