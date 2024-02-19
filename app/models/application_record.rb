# typed: true
# frozen_string_literal: true

class ApplicationRecord < FrozenRecord::Base
  self.base_path = Rails.root.join("db")
  self.auto_reloading = true
  self.abstract_class = true

  add_index(:id, unique: true)
end
