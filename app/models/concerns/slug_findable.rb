module SlugFindable
  extend ActiveSupport::Concern

  included do
    validates_presence_of   :slug
    validates_uniqueness_of :slug
    validates_format_of     :slug,  with: /\A[a-z0-9-]+\Z/,
                                    message: I18n.t('gannon.slug.validation.format')
  end

  class_methods { }

  # use slug for parameter/url generation
  def to_param
    self.slug
  end
end
