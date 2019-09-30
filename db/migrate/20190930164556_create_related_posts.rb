class CreateRelatedPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :related_posts do |t|
      t.string :url
      t.string :title
      t.string :author
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
