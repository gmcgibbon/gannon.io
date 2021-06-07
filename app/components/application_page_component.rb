# frozen_string_literal: true

class ApplicationPageComponent < ApplicationComponent
  renders_one(:title)
  renders_one(:body)
end
