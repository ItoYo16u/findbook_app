class BooksController < ApplicationController
  def latest
    count = params[:count]
    if count >= 50
      #TODO: return nothing
    else
      @books = Book.order(created_at:"DESC").limit(count)
      render json: @books
    end
  end
end