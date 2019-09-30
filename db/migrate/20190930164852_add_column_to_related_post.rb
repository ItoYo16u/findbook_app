class AddColumnToRelatedPost < ActiveRecord::Migration[5.1]
  def change
    add_reference :related_posts, :user, foreign_key: true
  end
end
