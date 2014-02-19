class CreateArticlePas < ActiveRecord::Migration
  def change
    create_table :article_pas do |t|
      t.string :title
      t.text :body
      t.string :tags, array: true, default: []

      t.timestamps
    end
  end
end
