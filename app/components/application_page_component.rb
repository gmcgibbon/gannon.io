# frozen_string_literal: true

class ApplicationPageComponent < ApplicationComponent
  def initialize(title: "Gannon", &block)
    @title = title
    @block = block
  end
end
