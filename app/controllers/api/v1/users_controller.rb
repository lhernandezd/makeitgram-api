module Api
  module V1
    class UsersController < ApplicationController
      def index
        @users = User.all
      end
       def create
        @user = User.new(user_params)
        if @user.save
          render partial: 'user', locals: { user: @user }, status: :created
        else
          render json: { error: "The user can't be created" }, status: 500
        end
      end
       private
        def user_params
          params.require(:user).permit(:firstname, :lastname, :username, :email, :password)
        end
    end
  end
end 