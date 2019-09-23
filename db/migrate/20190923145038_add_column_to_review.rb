class AddColumnToReview < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :interesting, :integer
    add_column :reviews, :trustable, :integer
    add_column :reviews, :understandable,:integer

  end
end
