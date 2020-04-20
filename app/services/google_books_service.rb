class GoogleBooksService
  
  require 'net/https'
  require 'json'
  require 'uri'

  class << self
    def fetch_books_by(keyword)

      # TODO implement keyword validator
      if keyword.empty?
        return {
          status: 'Failure',
          message: "at least one keyword required",
          data: {}
        }.to_json
      end
      # TODO: use array args and parse it
      #       or option parameters
      uri = google_api_url + "#{keyword}"
      encoded_uri = URI.encode(uri)
      parsed_uri = URI.parse(encoded_uri)
      begin
        res = Net::HTTP.get(parsed_uri)
      rescue => exception
        #TODO implement this
      end
      JSON.parse(res)
    end

    def fetch_book_by(isbn_code)
      # TODO: implement isbn validator
      #       requirement
      #       raise error when isbn_code is empty
      #       raise error when isbn.length != 11 or 13
      
      uri = google_api_url + "isbn#{isbn_code}"
      encoded_uri = URI.encode_www_form(uri)
      parsed_uri = URI.parse(encoded_uri)
      begin
        res = Net::HTTP.get(parsed_uri)
        JSON.parse(res)
      rescue => exception
        # TODO implement this
      end
    end

    private
    def google_api_url
      "https://www.googleapis.com/books/v1/volumes?q="
    end

  end
end