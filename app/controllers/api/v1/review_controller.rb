class ReviewController < ApplicationController
  def latest
    count = params[:count]
    @reviews = Review.where(created_at: "DESC").limit(count)
  end
end