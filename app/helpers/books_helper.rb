module BooksHelper
  class BookData
    attr_accessor :title,:identifiers,:url, :image_urls,:authors,:description,:published_at,:page_count
    def initialize(
      title: "不明",
      identifiers: [],
      url: "",
      image_urls:{"thumbnail"=>"https://bulma.io/images/placeholders/480x600.png"},
      authors: ["著者不明"],
      description:"No Description",
      published_at: "不明",
      page_count: 0
      )

      @title = title
      @identifiers = identifiers
      @url = url
      @image_urls = image_urls
      @authors = authors
      @description = description
      @published_at = published_at
      @page_count = page_count
    end

    def self.from_json(json)
      BookData.new(
        title: json["volumeInfo"]["title"],
        identifiers: json["volumeInfo"]["industryIdentifiers"],
        url: json["selfLink"],
        image_urls: json["volumeInfo"]["imageLinks"],
      )
    end
    
    def self.detail_from_json(json)
      BookData.new(
        title: json["title"],
        authors: json["authors"],
        image_urls: (json["imageLinks"])&.map{|key,url| [key,url.gsub("http://","https://")]}&.to_h,
        description: json["description"]&.truncate(170)|| json["subtitle"],
        published_at: json["publishedDate"],
        page_count: json["pageCount"].to_i,
      )

    end
  end
end
