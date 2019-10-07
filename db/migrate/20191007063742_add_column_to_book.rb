class AddColumnToBook < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :description, :text
    add_column :books, :genre, :string
    add_column :books, :keyword, :string
    add_column :books, :published_at, :datetime
  end
end
