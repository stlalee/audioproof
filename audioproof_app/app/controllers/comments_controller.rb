class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.create()
    @comment.comment_body = params[:comment][:comment_body]
    @comment.anonymous_comment = params[:comment][:anonymous_comment]
    @comment.user_id = current_user.id
    @comment.post_id = @post.id
    if @comment.save
      flash[:success] = "comment posted!"
      redirect_to request.referrer
    else
      flash[:danger] = @comment.errors
      redirect_to request.referrer
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = "Post deleted"
    redirect_to request.referrer || root_url
  end

  private

    def comment_params
      params.require(:comment).permit(:comment_body, :anonymous_comment, :post_id, :user_id)
    end

    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      redirect_to root_url if @comment.nil?
    end
end
