class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  require 'net/https'
  require 'json'
  require 'uri'

  def request_google_book_api_with(isbn_code)
    url="https://www.googleapis.com/books/v1/volumes?q=isbn:#{isbn_code}"
    url=URI.encode(url)
    res=Net::HTTP.get(URI.parse(url))
    res_json = JSON.parse(res)
    res_json
  end

  private
  def latest_params
    params.require(:count).to_i
  end
end
