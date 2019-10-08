class HomeController < ApplicationController
  def index
    @popular_books=Book.joins(:reviews).group(:id).order('count(user_id) desc').limit(5)
    @popular_design_books = Book.where(genre:"デザイン").joins(:reviews).group(:id).order('count(user_id) desc').limit(3)
    @popular_tech_books = Book.where(genre:"テクノロジー").joins(:reviews).group(:id).order('count(user_id) desc').limit(3)
    @popular_biz_books = Book.where(genre:"ビジネス").joins(:reviews).group(:id).order('count(user_id) desc').limit(3)
    @popular_humanity_books = Book.where(genre:"アート/カルチャー").joins(:reviews).group(:id).order('count(user_id) desc').limit(3)
    @popular_academic_books = Book.where(genre:"アカデミック").joins(:reviews).group(:id).order('count(user_id) desc').limit(3)
    @books= Book.order(created_at:"DESC").limit(6)
    @reviews= Review.order(created_at: "DESC").limit(4)
    @related_posts = RelatedPost.order(created_at: "DESC").limit(8))
  end
end
