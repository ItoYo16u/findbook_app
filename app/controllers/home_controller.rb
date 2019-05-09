class HomeController < ApplicationController
  def index
    @books=Book.joins(:reviews).group(:id).order('count(user_id) desc').limit(4)
  end
end
