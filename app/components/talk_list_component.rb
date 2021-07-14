# frozen_string_literal: true

class TalkListComponent < ApplicationComponent
  def initialize(talks:)
    @talks = talks
  end
end
