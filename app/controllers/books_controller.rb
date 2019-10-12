class BooksController < ApplicationController
  def index
    if params[:latest]
      @books = Book.order(created_at:"DESC").page(params[:page]).per(15)
    elsif params[:genre]
       @books = Book.where(genre:params[:genre]).joins(:reviews).group(:id).order('count(user_id) desc').limit(15)
    else
      @books=Book.joins(:reviews).group(:id).order('count(user_id) desc').limit(15)
    end
  end
  def show
    @book = Book.find_by(identifier: params[:identifier])
    if @book
      @related_books = Book.where(genre:@book.genre).distinct.where.not(id: @book.id).sample(3)
    else
      @related_books=[]
    end
    # sample(n) method returns an array containing n items
    # when n > array.length, returns an array randomly sorted
    @reviews= @book&.reviews.presence
    @reviewSummary = Review.summary(@book&.id)
    reviewCountByGroup=@reviews&.count_by_group
    if reviewCountByGroup
      @recommend=reviewCountByGroup[:recommend].values||[]
      @price = reviewCountByGroup[:price].values ||[]
      @understandable = reviewCountByGroup[:understandable].values||[]
      @trustable=reviewCountByGroup[:trustable].values||[]
      @interesting = reviewCountByGroup[:interesting].values||[]
    end
    book_identifier = params[:identifier]
    
    counter=0
    while true do
      res_json=request_google_book_api_with(book_identifier)
      if counter >= 3 or res_json["items"]
        res_json
        break
      end
      counter+=1
    end

    if res_json["items"]
      target_book_info = res_json["items"][0]["volumeInfo"]
      @book_title = target_book_info["title"] || ""
      @book_authors = target_book_info["authors"]||[]
      @book_img_urls = (target_book_info["imageLinks"])&.map{|key,url| [key,url.gsub("http://","https://")]}&.to_h ||{"thumbnail"=>"https://bulma.io/images/placeholders/480x600.png"}
      @book_description = target_book_info["description"]&.truncate(170)|| target_book_info["subtitle"]
      @published_at = target_book_info["publishedDate"]
      @page_count = target_book_info["pageCount"]
    elsif res_json["error"] or res_json["errors"]
      #数回requestし直してそれでもerrorが出たら以下の処理を実行
      flash[:alert]= "errorが発生しました"
      redirect_to root_path
    else
      flash["alert"]="データを取得できませんでした"
      redirect_to root_path
    end
  end


end
