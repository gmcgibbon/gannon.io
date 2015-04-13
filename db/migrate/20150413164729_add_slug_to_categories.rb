class AddSlugToCategories < ActiveRecord::Migration
  def change
    change_table :categories do |t|
      t.string :slug, unique: true
    end
  end
end
