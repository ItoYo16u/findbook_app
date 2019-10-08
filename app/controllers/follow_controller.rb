class FollowController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
  end
  
  def create
    user = User.find(params[:follow_id])
    following = current_user.follow(user)
    if following.save
      flash[:success] ="#{user.name}をフォローしました."
      redirect_back(fallback_location: root_path)
    else
      flash.now[:alert] = "#{user.name}のフォローに失敗しました."
    end
  end

  def destroy
    uer = User.find(params[:follow_id])
    following = current_user.unfollow(user)
    if following.destroy
      flash[:success] ="#{user.name}のフォローを解除しました."
      redirect_back(fallback_location: root_path)
    else
      flash.now[:alert] = "#{user.name}のフォロー解除に失敗しました."
    end
  end

end
