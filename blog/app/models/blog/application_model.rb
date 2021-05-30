# frozen_string_literal: true

module Blog
  class ApplicationModel
    include ActiveModel::Model

    class NotFoundError < StandardError
    end

    class << self
      attr_accessor(:_attribute_definitions)

      def attributes(*keys)
        attr_accessor(*keys)
        self._attribute_definitions ||= Set.new
        self._attribute_definitions.merge(keys)
      end
    end

    def ==(other)
      attributes == other.attributes
    end

    def attributes
      self.class._attribute_definitions.to_h do |key|
        [key, public_send(key)]
      end
    end

    define_model_callbacks(:initialize, only: %i(after))

    def initialize(*)
      run_callbacks(:initialize) do
        super
      end
    end
  end
end