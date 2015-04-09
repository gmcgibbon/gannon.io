class Article < ActiveRecord::Base

  include MarkdownWritable
  include SlugFindable

  belongs_to :user
  has_and_belongs_to_many :categories
end
