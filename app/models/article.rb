class Article < ActiveRecord::Base

  include MarkdownWritable
  include SlugFindable

  belongs_to :user

  has_many :categories, through: :articles_categories
  has_many :articles_categories
end
