class SearchController < ApplicationController
  def index
  end
  def search
    require 'net/https'
    require 'json'
    require 'uri'
    if params[:keyword].present?
      target=params[:keyword]
      url="https://www.googleapis.com/books/v1/volumes?q=#{target}"
      url=URI.encode(url)
      res=Net::HTTP.get(URI.parse(url))
      res_json = JSON.parse(res)
      book_list=res_json["items"]
      @book_list=[]
      book_list.each do |item|
        book_data = Book_data.new(
          item["volumeInfo"]["title"],
          item["volumeInfo"]["industryIdentifiers"],
          item["selfLink"],
          item["volumeInfo"]["imageLinks"],
          )
        @book_list << book_data
      end
      render action: :index

      #hash = JSON.parse(res)
      #@book_list=[]
      #hash.each do |key, value|
      #end
      
      else render plain: "enter keyword"  
    end
  end
  private
  class Book_data
    attr_accessor :title,:identifier,:url, :image_url
    def initialize(title,identifier,url,image_url)
      @title = title
      @identifier = identifier
      @url = url
      @image_url = image_url
    end
  end
end
