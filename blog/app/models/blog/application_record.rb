# typed: true
# frozen_string_literal: true

module Blog
  class ApplicationRecord < FrozenRecord::Base
    self.base_path = Engine.root.join("db")
    self.auto_reloading = true
    self.abstract_class = true

    add_index(:id, unique: true)
  end
end
