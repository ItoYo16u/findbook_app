class ReviewController < ApplicationController
  def latest
    count = params[:count]
    @reviews = Review.latest(count)
  end
end