class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.author
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @new_post = @user.posts.new(post_params)
    @new_post.likes_counter = 0
    @new_post.comment_counter = 0
    respond_to do |format|
      format.html do
        if @new_post.save
          flash.alert = 'Successful created'
          redirect_to "/users/#{@new_post.author.id}/posts/", notice: 'Created Successfully'
        else
          flash.now[:error] = 'Failed to create Post'
          render :new, alert: 'Failed to Create!'
        end
      end
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
