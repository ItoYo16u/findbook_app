class HomeController < ApplicationController
  def index
    @popular_books=Book.review_ranking(5)
    @popular_design_books = Book.where(genre:"デザイン").review_ranking(3)
    @popular_tech_books = Book.where(genre:"テクノロジー").review_ranking(3)
    @popular_biz_books = Book.where(genre:"ビジネス").review_ranking(3)
    @popular_humanity_books = Book.where(genre:"アート/カルチャー").review_ranking(3)
    @popular_academic_books = Book.where(genre:"アカデミック").review_ranking(3)
    @books= Book.latest(6)
    @reviews= Review.latest(4)
    @related_posts = RelatedPost.latest(8)
  end
end
