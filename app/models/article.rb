class Article < ActiveRecord::Base

  belongs_to :user
  has_and_belongs_to_many :categories

  validates_presence_of   :slug, :title, :content
  validates_uniqueness_of :slug
  validates_format_of     :slug,  with: /\A[a-z0-9-]+\Z/,
                                  message: I18n.t('gannon.slug.validation.format')

  # use slug for parameter/url generation
  def to_param
    slug
  end
end
