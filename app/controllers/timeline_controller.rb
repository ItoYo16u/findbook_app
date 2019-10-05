class TimelineController < ApplicationController
    before_action :authenticate_user!
    def index
        followings = UserUser.where(user_id:current_user.id).pluck(:follow_id)
        followings << current_user.id
        @reviews = Review.order(created_at:"DESC").where(user_id:followings).page(params[:page]).per(15)
    end
end