class HomeController < ApplicationController
  def index
    @popular_books=Book.joins(:reviews).group(:id).order('count(user_id) desc').limit(5)
    @books= Book.order(created_at:"DESC").limit(6)
    @reviews= Review.order(created_at: "DESC").limit(4)
    @related_posts = RelatedPost.order(created_at: "DESC").limit(4)
  end
end
