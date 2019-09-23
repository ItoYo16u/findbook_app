module ApplicationHelper
    def isbn13to10(isbn)
        if isbn.to_s.length == 13
          identifier= isbn.to_s.chop.split("").drop(3).join() + ((isbn).to_s.chop.split("").map(&:to_i).drop(3).map.with_index{|v,i| v*(10-i)}.sum%11*(-1) +11).to_s.gsub(/10/,"X").gsub(/11/,"0") 
          identifier
        elsif isbn.to_s.length==10
            isbn
        end
    end
    def default_meta_tags
        {
            site: "findbook app",
            reverse: true,
            separator: "|",
            og:default_og,
            twitter: default_twitter_card
        }
    end

    private
    def default_og
        {
            title: :full_title,
            description: :description,
            url: request.url,
            image:""
        }
    end
    
    def default_twitter_card
        {
            card: "summary",
            site: "@twitter_account_id"
        }
    end

end
