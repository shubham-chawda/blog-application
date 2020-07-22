class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
 	end

 	def destroy
 		@post = Post.find(params[:post_id])
 		if current_user == @post.user
	 		@comment = @post.comments.find(params[:id])
	 		@comment.destroy
	    	redirect_to post_path(@post)
	    else
	    	redirect_to post_path(@post), notice: "You are not authorized to delete that comment"
	    end
 	end

 private
    def comment_params
      params.require(:comment).permit(:body)
    end

end
