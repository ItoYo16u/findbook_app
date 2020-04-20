class SearchController < ApplicationController
  def index
  end
  def search

    if params[:keyword].present?
      # TODO: implement keyword parser
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
        @book_list = res_json["items"].map{|json| BooksHelper::BookData.from_json(json)}
        
        render action: :index
      else
        flash["alert"]="データの取得に失敗しました"
        redirect_to root_path
      end
      
    else 
        flash["alert"] = "キーワードを入力してください"
        redirect_to root_path  
    end
  end
  
end
