# frozen_string_literal: true

module Blog
  class ApplicationRecord < FrozenRecord::Base
    self.base_path = Engine.root.join("db")
    self.auto_reloading = true
    
    add_index(:id, unique: true)
  end
end
