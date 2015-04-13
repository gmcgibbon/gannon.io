class AddSlugToCategories < ActiveRecord::Migration
  def change
    change_table :categories do |t|
      t.string :slug, unique: true, before: :created_at
    end
  end
end
