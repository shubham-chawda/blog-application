class CommentsController < ApplicationController

  before_action :find_comment_of_post, only: [:edit, :update, :destroy]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to post_path(@post), notice: "Comment Created Successfully"
    else
      redirect_to post_path(@post), notice: "Something went wrong"
    end
 	end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to post_path(@post), notice: "Updated Successfully"
    else
      redirect_to post_path(@post), notice: "You are not authorized to edit this comment"
    end
  end

 	def destroy
 		if @comment.destroy
	    redirect_to post_path(@post), notice: "Comment deleted Successfully"
	  else
	   	redirect_to post_path(@post), notice: "You are not authorized to delete this comment"
	  end
 	end

 private
    def comment_params
      params.require(:comment).permit(:body)
    end

    def find_comment_of_post
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
    end
end
