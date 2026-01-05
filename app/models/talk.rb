# frozen_string_literal: true

class Talk < ApplicationRecord
  scope(:latest, -> { all.sort_by(&:uploaded_at).reverse })

  def conference
    id.titleize
  end
end
