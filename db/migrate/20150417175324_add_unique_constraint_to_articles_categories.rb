class AddUniqueConstraintToArticlesCategories < ActiveRecord::Migration
  def change
    remove_column :articles_categories, :id
    remove_index :articles_categories, [:article_id, :category_id]

    add_index :articles_categories, [:article_id, :category_id], unique: true
    add_index :articles_categories, [:category_id, :article_id], unique: true
  end
end
