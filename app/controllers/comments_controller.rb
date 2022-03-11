class CommentsController < ApplicationController
    def new
      @comment =Comment.new
    #   @user = User.find(params[:user_id])
    #   @post = @user.posts.find(params[:post_id])
    end
  
    def create
    #   @post = Post.find(params[:post_id])
    # #   @post = Post.find(params[:post_id])
    #   @user = User.find(params[:user_id])
    @user = User.find(params[:user_id])
    @posts = @user.posts

      @new_comment = @post.comments.new(
        comment_params
        # author_id: @user.id,
        # post_id: @post.id
      )
    #   @new_comment.post_id = @post.id
      if @new_comment.save
        # Comment.comment_counter(@post.id)
        Comment.count_comments(@post.id) 
        redirect_to "/users/#{@post.author_id}/posts/#{@post.id}", notice: 'Posted Success!'
      else
        render :new, alert: 'Failed to Post the Comment'
      end
    end

    def comment_params
        params.require(:comment).permit(:text)
    end
end
