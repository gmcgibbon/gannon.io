class Page < ActiveRecord::Base

  include Document

  validates_with Validators::SlugRoutable
end
