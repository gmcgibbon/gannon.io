module SlugResourceAuthorizable
  extend ActiveSupport::Concern

  included do
    load_and_authorize_resource find_by: :slug,
                                id_param: :slug
  end

  class_methods { }
end
