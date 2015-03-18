class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :slug, unique: true
      t.text :content
      t.references :user, index: true

      t.timestamps null: false
    end

    add_index :articles, :slug
    add_index :articles, :title
  end
end
