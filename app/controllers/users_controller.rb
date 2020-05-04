class UsersController < ApplicationController
    skip_before_action :require_logged_in, only: [:new, :create]
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        return render 'new' unless @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end


    def show
        @user = User.find(params[:id])

    end

   



    private

    def user_params
        params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
    end
end
