class Category < ActiveRecord::Base

  include SlugFindable

  has_many :articles, through: :articles_categories
  has_many :articles_categories

  # Converts to Jbuilder JSON
  def to_builder_json
    to_builder.target!
  end

  private

  # Converts to Jbuilder object
  def to_builder
    Jbuilder.new do |json|
      if self.valid?
        json.title title
        json.slug  slug
      else
        json.error errors.full_messages.to_sentence
      end
    end
  end
end
