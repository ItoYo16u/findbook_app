class BooksController < ApplicationController
  def show
    def request_google_book_api_with(isbn_code)
      url="https://www.googleapis.com/books/v1/volumes?q=isbn:#{isbn_code}"
      url=URI.encode(url)
      res=Net::HTTP.get(URI.parse(url))
      res_json = JSON.parse(res)
      res_json
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
      @book_title = target_book_info["title"]
      @book_authors = target_book_info["authors"]
      @book_img_urls = target_book_info["imageLinks"]
      @book_description = target_book_info["subtitle"]

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
