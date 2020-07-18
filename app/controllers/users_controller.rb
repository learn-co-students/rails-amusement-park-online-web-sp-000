class UsersController < ApplicationController
    def new
    end

    def create
        if params[:user][:name].present? && params[:user][:password].present?
            @user = User.create(user_params)
            session[:user_id] = @user.id 
            redirect_to user_path(@user)    
          else
            redirect_to controller: 'users', action: 'new'
        end      
    end

    def show
        @user = User.find_by(id: params[:id])
        @users = User.all
    end

    private
 
    def user_params
      params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height)
    end


end
