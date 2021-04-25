class UsersController < ApplicationController
    before_action :require_logged_in, only: [:show]

    def new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to @user
        else
            render :new
        end
    end

    def show
        @user = User.find_by(id: params[:id])
    end
  
    private 
  
    def user_params 
      params.require(:user).permit(:name, :password, :height, :nausea, :happiness, :tickets, :admin)
    end

end