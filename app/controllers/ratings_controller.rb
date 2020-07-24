class RatingsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @rating = @post.ratings.build(rating_params)
    @rating.user_id = current_user.id
    if @rating.save
      redirect_to post_path(@post), notice: "Successfully Submited"
    else
      redirect_to post_path(@post), notice: "Something went Wrong"
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    rating = Rating.find(params[:id])
    if rating.destroy
      redirect_to post_path(post), notice: "Successfully Deleted"
    else
      redirect_to post_path(post), notice: "Something went Wrong"
    end
  end

  private

   def rating_params
     params.require(:rating).permit(:star)
   end
end
