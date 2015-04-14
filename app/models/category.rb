class Category < ActiveRecord::Base

  include SlugFindable

  has_and_belongs_to_many :articles

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
