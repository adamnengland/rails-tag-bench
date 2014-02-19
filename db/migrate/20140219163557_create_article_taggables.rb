class CreateArticleTaggables < ActiveRecord::Migration
  def change
    create_table :article_taggables do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
