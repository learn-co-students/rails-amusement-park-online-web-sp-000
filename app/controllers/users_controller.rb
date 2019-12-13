require 'pry'
class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:index, :new, :create]


    def index
        @users = User.all 
    end 

    def new
        @user = User.new 
    end 

    def create
        @user = User.new(user_params)
        if @user != nil || @user != ""
            @user.save 
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            redirect_to '/'
        end 
    end 

    def show
        @user = User.find_by(id: params[:id])
    end 

    def update 
        @user = User.find_by(id: params[:id])
        @user.update(user_params)
        redirect_to user_path(@user)
    end 

    private

    def user_params
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end

    def require_login
        return redirect_to '/' unless session.include? :user_id
    end 


end 

