class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :slug, unique: true
      t.text :content

      t.timestamps null: false
    end

    add_index :pages, :slug
    add_index :pages, :title
  end
end
