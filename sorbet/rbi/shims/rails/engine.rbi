# typed: true

module Rails
  class Engine
    class << self
      sig { returns(ActionDispatch::Routing::RouteSet) }
      def routes; end

      sig { returns(Pathname) }
      def root; end
    end
  end
end
