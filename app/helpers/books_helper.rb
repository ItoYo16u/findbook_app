module BooksHelper
  class BookData
    attr_accessor :title,:identifiers,:url, :image_urls
    def initialize(title,identifiers,url,image_urls)
      @title = title
      
      @identifiers = identifiers
      @url = url
      @image_urls = image_urls
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
