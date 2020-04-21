module Api
  module V1
    class BooksController < ApplicationController
      def latest
        count = params[:count].to_i
        if count >= 50
          #TODO: return nothing
        else
          @books = Book.latest(latest_params[:count])
          render json: { status: 'SUCCESS', message: "found #{count} books", data: @books }
        end
      end

      def summary
        logger.debug(summary_params)
        book = Book.find(summary_params)
        reviewSummary = Review.summary_v2(summary_params)
        render json: {
          status: "SUCCESS",
          message: "summary of ##{book.title}",
          data: {
            book: book.to_json,
            review: reviewSummary.to_json
        }
      }
        # NOTE: Review.summary returns array[double]
        # TODO: change response from array to hash  
        #       for simplicity    
      end

      def reviews
        book = Book.find(params[:id])
        reviews = Review.where(book_id: book.id).latest(params[:count])
        render json: {
          status: "SUCCESS",
          message: "found #{reviews.count} reviews",
          data: reviews.to_json
        }
      end
      private
      def latest_params
        params.require(:count)
      end
      def summary_params
        params.require(:book_id)
      end
    end
  end
end