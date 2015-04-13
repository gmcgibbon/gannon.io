class Category < ActiveRecord::Base

  include SlugFindable

  has_and_belongs_to_many :articles
end
