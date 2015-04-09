class Page < ActiveRecord::Base

  include MarkdownWritable
  include SlugFindable

  validates_with Validators::SlugRoutable
end
