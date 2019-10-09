module ApplicationHelper
    def isbn13to10(isbn)
        if isbn.to_s.length == 13
          identifier= isbn.to_s.chop.split("").drop(3).join() + ((isbn).to_s.chop.split("").map(&:to_i).drop(3).map.with_index{|v,i| v*(10-i)}.sum%11*(-1) +11).to_s.gsub(/10/,"X").gsub(/11/,"0") 
          identifier
        elsif isbn.to_s.length==10
            isbn
        end
    end
    def http2https(url)
        url.gsub("http://","https://")
    end

    def default_meta_tags
        {
            site: "findbook app",
            title:"専門書・ビジネス書・技術書のメモ共有サイトBookI/O",
            reverse: true,
            canonical:request.original_url,
            charset:"utf-8",
            keywords:"自己啓発,プログラミング,デザイン,アート,要約,学習,アウトプット,メモ",
            separator: "|",
            og:default_og,
            twitter: default_twitter_card
        }
    end
    
    #view values
    def service_name
        "BookI/O"
    end


    def genre_tag_style(book)
        case book.genre
        when "テクノロジー"
            'is-tech'
        when "アート/カルチャー"
            'is-humanity'
        when "ビジネス"
            'is-biz'
        when "アカデミック"
            'is-academic'
        when "デザイン"
            'is-design'
        else
            ''
        end
    end

    private
    def default_og
        {
            title: :full_title,
            description: :description,
            url: request.url,
            image:"",
            locale:"ja_JP",
            type:"website",
        }
    end
    
    def default_twitter_card
        {
            card: "summary",
            site: "@by110416"
        }
    end
end
