class UsersController < ApplicationController

    def show
      return redirect_to "/" unless session.include? :user_id
       @user = User.find(params[:id])   
    end

    def new
       @user = User.new
    end

    def create   
        @user = User.create(user_params)
        session[:user_id] = @user.id
       redirect_to user_path(@user)
    end

    private

    def user_params
      params.require(:user).permit(:name, :password, :height, :tickets, :nausea, :happiness, :admin)
    end


end
