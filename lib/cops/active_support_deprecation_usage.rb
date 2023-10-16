# frozen_string_literal: true

module Cops
  class ActiveSupportDeprecationUsage < RuboCop::Cop::Base
    MSG = "ActiveSupport::Deprecation is deprecated, please use your your own deprecator."
    NAMES = %i(warn debug behavior).freeze

    def_node_matcher :deprecation_singleton_call?, <<~PATTERN
      (send (const (const {(cbase) nil?} :ActiveSupport) :Deprecation) ...)
    PATTERN

    def on_send(node)
      if deprecation_singleton_call?(node) &&
         node.method_name.in?(NAMES)
        add_offense(node)
      end
    end
  end
end
