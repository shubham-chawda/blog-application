class FollowingsController < ApplicationController

  def create
    @follow = current_user.followings.build(:follower_id => params[:follower_id])
    if @follow.save
      flash[:notice] = "Following Successfully."
      redirect_to root_url
    else
      flash[:notice] = "Unable to follow."
      redirect_to root_url
    end
  end

  def destroy
    # @friendship = current_user.followings.find(params[:id])
    @following = Following.find_by(follower_id: params[:id])
    if @following
      @following.destroy
      flash[:notice] = "Remove from following list"
      redirect_to root_url
    end
  end


end
