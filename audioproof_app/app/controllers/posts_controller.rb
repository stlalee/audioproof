class PostsController < ApplicationController
  def index # dashboard? or should that be a separate view
    @posts = Post.all
  end

  def new
  end

  def create
    @post = Post.new(post_params)
	@post.save
	redirect_to @post
  end

  def show
    @post = Post.find(params[:id])
  end

  def search
  end

  private
    def post_params
      params.require(:post).permit(:title, :link, :body)
    end
end
