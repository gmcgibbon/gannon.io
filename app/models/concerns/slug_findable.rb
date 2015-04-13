module SlugFindable
  extend ActiveSupport::Concern

  included do
    before_validation       :ensure_slug
    validates_presence_of   :title
    validates_uniqueness_of :slug
    validates_format_of     :slug,  with: /\A[a-z0-9-]+\Z/,
                                    message: I18n.t('gannon.slug.validation.format')
  end

  class_methods { }

  # ensures a slug exists by using URL safe title
  def ensure_slug
    self.slug ||= self.title.parameterize
  end

  # use slug for parameter/url generation
  def to_param
    self.slug
  end
end
