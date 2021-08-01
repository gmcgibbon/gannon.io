# frozen_string_literal: true

class Talk < ApplicationRecord
  def conference
    id.titleize
  end
end
