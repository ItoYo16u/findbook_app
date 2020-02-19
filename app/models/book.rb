class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews
  has_many :related_posts,dependent: :destroy
  scope :review_ranking, ->(count){
    joins(:reviews).group(:id).order('count(user_id) desc').limit(count)
  }
  scope :select_randomly_from_the_same_category_as,->(book,count){
    where(genre: book.genre).distinct.where.not(id: book.id).sample(count)
  }
end
