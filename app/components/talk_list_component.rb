# frozen_string_literal: true

class TalkListComponent < ApplicationComponent
  def initialize(talks:)
    super()
    @talks = talks
  end
end
