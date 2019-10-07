class ReviewController < ApplicationController
    def index
        @reviews = Review.page(params[:page]).per(20) 
    end
    def create
        existing_book = Book.find_by(identifier: params[:identifier])
        if existing_book.present?
            
            current_user.reviews.create(
                user_id:current_user.id,
                content:params[:review][:content],
                book_id:existing_book.id,
                trustable:params[:review][:trustable],
                understandable:params[:review][:understandable],
                interesting:params[:review][:interesting],
                recommend:params[:review][:recommend],
                price:params[:review][:recommend],
                good:params[:review][:good],
                bad:params[:review][:bad],
            )
            flash[:notice] = "メモを登録しました。"
            redirect_to root_path
        else
          @book=Book.create(book_params)
          if @book.save
            @rvw = current_user.reviews.create(
                user_id:current_user.id,
                content:params[:review][:content],
                book_id:@book.id,
                trustable:params[:review][:trustable],
                understandable:params[:review][:understandable],
                interesting:params[:review][:interesting],
                recommend:params[:review][:recommend],
                price:params[:review][:price],
                good:params[:review][:good],
                bad:params[:review][:bad],
            )
            if @rvw.save
                flash[:notice] = "メモを登録しました。"
            end
            redirect_to root_path
          end
        end

    end
    def review_params
        params.require(:review).permit(:content,:good,:bad,:interesting,:understandable,:trustable,:recommend,:price)
    end
    def book_params
        params.permit(:title,:identifier,:img_url,:description,:genre,:keyword,:published_at)
    end
end
