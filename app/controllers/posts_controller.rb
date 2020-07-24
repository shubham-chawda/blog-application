class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy, :publish_post, :find_user]

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
	end

	def update
	  if @post.update(post_params)
	    redirect_to @post
	  else
	    render 'edit'
	  end
	end

	def destroy
	  @post.destroy
	  redirect_to posts_path
	end

	def show
	end

	def index
	  # @posts = Post.paginate(:page => params[:page], per_page: 3).where(publish: true)
    @posts = current_user.posts + Post.other_user(current_user)
    @posts = (current_user.posts.paginate(:page => params[:page]) + Post.other_user(current_user).paginate(:page => params[:page]))
	end

  def publish_post
    @post.publish = !@post.publish
    if @post.save
      redirect_to post_path(@post), notice: "Post Published Successfully!"
    else
      redirect_to post_path(@post), notice: "Something Went Wrong!"
    end
  end

  def find_user
     @user = @post.user
  end

 private

  def post_params
    params.require(:post).permit(:title, :details)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
