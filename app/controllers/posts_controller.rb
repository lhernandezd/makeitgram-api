class PostsController < ApplicationController
  def index
    @posts = Post.all
    render json: @posts
  end
   def create
    @post = Post.new(post_params)
    if @post.save 
      render json: @post, status: :created
    else
      render json: { error: "The post can't be created" }, status: 500
    end
  end
   private
    def post_params
      params.require(:post).permit(:description, :location)
    end
end
