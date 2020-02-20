module HomeHelper
    def category_color(book)#: Book => category :String
        case book.genre
        when "デザイン" then
            "#f08080"
        when "ビジネス" then
            "#088aa1"
        when "テクノロジー" then
            "#688bff"
        when "アート/カルチャー"
            "gold"
        when "アカデミック" then
            "#9932cc"
        else
            "gray"
        end
    end
    
end
