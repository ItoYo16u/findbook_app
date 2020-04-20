class SearchController < ApplicationController
  def index
  end
  def search

    if params[:keyword].present?
      keyword=params[:keyword]
      counter=0
      while true do
        res_json=GoogleBooksService.fetch_books_by(keyword)
        if counter >= 3 or res_json["items"]
          res_json
          break
        end
        counter+=1
      end
        
      if res_json["items"]
        book_list=res_json["items"]
        @book_list = book_list.map{|json| BookData.from_json(json)}
        
        render action: :index
      else
        flash["alert"]="データの取得に失敗しました"
        redirect_to root_path
      end
      #hash = JSON.parse(res)
      #@book_list=[]
      #hash.each do |key, value|
      #end
      
      else 
        flash["alert"] = "キーワードを入力してください"
        redirect_to root_path  
    end
  end
  private
  class BookData
    attr_accessor :title,:identifier,:url, :image_url
    def initialize(title,identifier,url,image_url)
      @title = title
      
      @identifier = identifier
      @url = url
      @image_url = image_url
    end

    def self.from_json(json)
      BookData.new(
        json["volumeInfo"]["title"],
        json["volumeInfo"]["industryIdentifiers"],
        json["selfLink"],
        json["volumeInfo"]["imageLinks"],
      )
    end
  end
end
