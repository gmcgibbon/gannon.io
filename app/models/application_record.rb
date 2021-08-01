# frozen_string_literal: true

class ApplicationRecord < FrozenRecord::Base
  self.base_path = Rails.root.join("db")
  self.auto_reloading = true
  
  add_index(:id, unique: true)
end
