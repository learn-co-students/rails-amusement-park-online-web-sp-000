class UsersController < ApplicationController


    def home
        

    end

    def signin
        @users = User.all
    end
    def login
        
        user = User.find_by(name: params[:user][:name])
        if user
          session[:user_id] = user.id
          redirect_to user_path(user)
        else
          redirect_to signin_path
        end
      end

    def new
        @user = User.new
    end
    def show
        if logged_in?
        @user = User.find_by(:id => params[:id])
        else
            redirect_to "/"
        end
    end
    def create
        
        @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to user_path(@user.id)
    end
    def logout
        session.clear
        redirect_to '/'
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end

end


