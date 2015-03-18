class CreateArticlesCategories < ActiveRecord::Migration
  def change
    create_table :articles_categories do |t|
      t.references :article
      t.references :category
    end

    add_index :articles_categories, [:article_id, :category_id]
  end
end
