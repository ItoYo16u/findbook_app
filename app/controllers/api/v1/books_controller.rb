module Api
  module V1
    class BooksController < ApplicationController
      def latest
        count = params[:count].to_i
        if count >= 50
          #TODO: return nothing
        else
          @books = Book.latest(count)
          render json: { status: 'SUCCESS', message: "found #{count} books", data: @books }
        end
      end
    end
  end
end