class Page < ActiveRecord::Base

  validates_with          Validators::SlugRoutable
  validates_uniqueness_of :slug
  validates_format_of     :slug,  with: /\A[a-z0-9-]+\Z/,
                                  message: I18n.t('gannon.slug.validation.format')
  validates_presence_of   :slug, :title, :content

  def to_param
    slug
  end
end
