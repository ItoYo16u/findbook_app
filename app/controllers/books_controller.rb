class BooksController < ApplicationController
  def show
    book_identifier = params[:identifier]
    url="https://www.googleapis.com/books/v1/volumes?q=isbn:#{book_identifier}"
    url=URI.encode(url)
    res=Net::HTTP.get(URI.parse(url))
    res_json = JSON.parse(res)
    target_book_info = res_json["items"][0]["volumeInfo"]
    @book_title = target_book_info["title"]
    @book_authors = target_book_info["authors"]
    @book_img_urls = target_book_info["imageLinks"]
    @book_description = target_book_info["subtitle"]
  end

end
