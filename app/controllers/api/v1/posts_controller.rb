module Api
  module V1
    class PostsController < ApplicationController
      def index
        @posts = Post.all
      end
       def create
        @post = Post.new(post_params)
        if @post.save
          render partial: 'post', locals: { post: @post }, status: :created
        else
          render json: { error: "The post can't be created" }, status: 500
        end
      end
       private
        def post_params
          params.require(:post).permit(:description, :location, :user_id)
        end
    end
  end
end 
