module Api
  module V1
    class ReviewController < ApplicationController
      def latest
        @reviews = Review.latest(latest_params)
        render json: { status: 'SUCCESS', message: "found #{@reviews.length} reviews", data: @reviews }
      end
    end
  end
end
