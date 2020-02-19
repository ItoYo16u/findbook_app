class ReviewController < ApplicationController
    before_action :authenticate_user!,except: [:index]
    def index
        @reviews = Review.page(params[:page]).per(20) 
    end
    def create
        existing_book = Book.find_by(identifier: params[:identifier])
        if existing_book.present?
            review_params_merged_with_user_and_book = review_params.merge(user_id:current_user.id,book_id:existing_book.id)
        else #when book does not exist, 
          @book=Book.new(book_params)
            if @book.save
              review_params_merged_with_user_and_book = review_params.merge(user_id: current_user.id,book_id: @book.id)
            else
            # when failed to save book,
              flash[:alert] = "本の保存に失敗しました"
              redirect_to root_path
            end
        end
        @rvw = current_user.reviews.new(review_params_merged_with_user_and_book)
        if @rvw.save
            flash[:notice] = "メモを登録しました."
        else
            flash[:alert] = "メモの保存に失敗しました."
        end
        redirect_to root_path
    end

    def update
        @target_review = current_user.reviews.find(params[:review][:id])
        @target_review.update(review_params)
    end
    
    private
    def review_params
        params.require(:review).permit(:id,:content,:good,:bad,:interesting,:understandable,:trustable,:recommend,:price)
    end
    def book_params
        params.permit(:title,:identifier,:img_url,:description,:genre,:keyword,:published_at)
    end
end
