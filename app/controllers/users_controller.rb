class UsersController < ApplicationController
    before_action :logged_in?, except: [:new, :create]
    def new
        @user = User.new
    end
    def create
        @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to @user
    end
    def edit
        @user = User.find(params[:id])
    end
    def update
        @user = User.find(params[:id])
        if @user.save
          @user.update(user_params)
          redirect_to @user
        else
          redirect_to edit_user_path(@user)
        end
    end
    def show
        @user = User.find(params[:id])
        
    end
    private
    def user_params
        params.require(:user).permit(:name, :happiness, :nausea, :height, :tickets, :admin, :password)
    end
end