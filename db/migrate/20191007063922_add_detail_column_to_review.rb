class AddDetailColumnToReview < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :good, :string
    add_column :reviews, :bad, :string
  end
end
