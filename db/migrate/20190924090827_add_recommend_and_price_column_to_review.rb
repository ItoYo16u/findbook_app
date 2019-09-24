class AddRecommendAndPriceColumnToReview < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :recommend,:integer
    add_column :reviews, :price, :integer
  end
end
