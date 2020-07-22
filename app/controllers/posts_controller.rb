class PostsController < ApplicationController
  def new
	  @post = current_user.posts.new
	end

	def create
	  @post = current_user.posts.new(post_params)
	  if @post.save
	  	redirect_to posts_path
	  else
	  	render 'new'
	  end
	end

	def edit
	  @post = Post.find(params[:id])
	end

	def update
	  @post = Post.find(params[:id])
	  if @post.update(post_params)
	    redirect_to @post
	  else
	    render 'edit'
	  end
	end

	def destroy
	  @post = Post.find(params[:id])
	  @post.destroy
	  redirect_to posts_path
	end

	def show
	  @post = Post.find(params[:id])
	end

	def index
	  @posts = Post.all
	end

  def publish_post
    @post = Post.find(params[:id])
    @post.publish = !@post.publish
    if @post.save
      redirect_to post_path(@post), notice: "Post Published Successfully!"
    else
      redirect_to post_path(@post), notice: "Something Went Wrong!"
    end
  end

 private

  def post_params
    params.require(:post).permit(:title, :details)
  end
end
