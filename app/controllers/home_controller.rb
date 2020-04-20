class HomeController < ApplicationController
  def index
    @popular_books=Book.review_ranking(5)
    @popular_design_books = Book.where(genre:"デザイン").review_ranking(book_count)
    @popular_tech_books = Book.where(genre:"テクノロジー").review_ranking(book_count)
    @popular_biz_books = Book.where(genre:"ビジネス").review_ranking(book_count)
    @popular_humanity_books = Book.where(genre:"アート/カルチャー").review_ranking(book_count)
    @popular_academic_books = Book.where(genre:"アカデミック").review_ranking(book_count)
    @books= Book.latest(6)
    @reviews= Review.latest(4)
    @related_posts = RelatedPost.latest(8)
  end

  private
  def book_count
    3
  end
end
