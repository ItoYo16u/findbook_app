class BooksController < ApplicationController
  
  def index
    # return books recently registered
    if params[:latest] #exists
      @books = Book.order(created_at:"DESC").page(params[:page]).per(15)
    
    # return designated genre of books
    elsif params[:genre] #exists
      @books = Book.where(genre: params[:genre]).review_ranking(15)
    
    else # return top 15 books
      @books=Book.review_ranking(15)
    end
  end

  def show
    book = Book.find_by(identifier: params[:identifier])
    if book
      @related_books = Book.select_randomly_from_the_same_category_as(book,3)
      @related_posts = book.related_posts || []
      #TODO BooksHelper::BookDataにパースしてフロントでnull checkをする処理を減らす
    else
      @related_books= []
      @related_posts = []

    end
    @reviews= book&.reviews.presence
    @reviewSummary = Review.summary(book&.id)
    reviewCountByGroup=@reviews&.count_by_group
    if reviewCountByGroup
      @recommend=reviewCountByGroup[:recommend].values||[]
      @price = reviewCountByGroup[:price].values ||[]
      @understandable = reviewCountByGroup[:understandable].values||[]
      @trustable=reviewCountByGroup[:trustable].values||[]
      @interesting = reviewCountByGroup[:interesting].values||[]
    end

    book_identifier = params[:identifier]
    res_json = request_information_of_the_book_by(book_identifier)
    if res_json
      parse_book_information_of(res_json)
    else
      flash[:alert] = "データを取得できませんでした."
      redirect_to root_path
    end
  end



  private
  def parse_book_information_of(response_json)
    target_book_info = response_json["items"][0]["volumeInfo"]
    @target_book = BooksHelper::BookData.detail_from_json(target_book_info)
  end

  def request_information_of_the_book_by(identifier,limit=5)
    return nil if limit == 0
    res_json = request_google_book_api_with(identifier)
    if res_json["items"]
      res_json
    else
      request_information_of_the_book_by(identifier,limit-1)
    end
  end
end
